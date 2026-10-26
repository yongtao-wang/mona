import 'dart:math' as math;

import 'package:clock/clock.dart';
import 'package:cloud_contracts/cloud_contracts.dart';
import 'package:drift/drift.dart';

import '../cloud/gateway_client.dart';
import '../cloud/moment_analyzer.dart';
import '../cloud/pseudonymizer.dart';
import '../core/ids.dart';
import '../core/log.dart';
import '../core/result.dart';
import '../data/database.dart';
import 'moment_loader.dart';

/// The phone-side retry queue for moment analysis (spec §8.8), on the `cloud_job` table.
class AnalysisQueue {
  AnalysisQueue(this._db, this._analyzer, this._loader, {this.clock = const Clock(), Log? log}) : _log = log ?? Log();

  final AppDatabase _db;
  final MomentAnalyzer _analyzer;
  final MomentLoader _loader;
  final Clock clock;
  final Log _log;

  /// 10 s, 1 min, 5 min, 30 min, then hourly; `Retry-After` overrides it.
  static const backoff = [Duration(seconds: 10), Duration(minutes: 1), Duration(minutes: 5), Duration(minutes: 30)];
  static const maxAttempts = 5;

  /// `model_output_invalid` is retried at most 3 times (§12.7).
  static const maxInvalidAttempts = 3;

  /// Queues a moment; re-analysis resets the existing row (one job per target and kind).
  Future<void> enqueue(String momentId) => _db
      .into(_db.cloudJob)
      .insert(
        CloudJobCompanion.insert(
          id: newId(),
          kind: 'label',
          targetId: momentId,
          status: 'queued',
          nextAttemptAt: clock.now().millisecondsSinceEpoch,
        ),
        onConflict: DoUpdate(
          (_) => CloudJobCompanion(
            status: const Value('queued'),
            attempts: const Value(0),
            nextAttemptAt: Value(clock.now().millisecondsSinceEpoch),
            lastError: const Value(null),
          ),
          target: [_db.cloudJob.kind, _db.cloudJob.targetId],
        ),
      );

  /// Jobs held by a kill switch go back to the queue when analysis is enabled again.
  Future<void> unblock() => (_db.update(_db.cloudJob)..where((j) => j.status.equals('blocked'))).write(
    CloudJobCompanion(status: const Value('queued'), nextAttemptAt: Value(clock.now().millisecondsSinceEpoch)),
  );

  /// Runs every job that is due, one at a time. Returns how many it ran.
  Future<int> runDue() async {
    final now = clock.now().millisecondsSinceEpoch;
    final due =
        await (_db.select(_db.cloudJob)
              ..where(
                (j) => j.kind.equals('label') & j.status.equals('queued') & j.nextAttemptAt.isSmallerOrEqualValue(now),
              )
              ..orderBy([(j) => OrderingTerm(expression: j.nextAttemptAt)]))
            .get();
    for (final job in due) {
      await _run(job);
    }
    return due.length;
  }

  Future<void> _run(CloudJobData job) async {
    await _setJob(job.id, status: 'in_flight');
    await _setMoment(job.targetId, 'running');
    final snapshot = await _loader.load(job.targetId);
    if (snapshot == null) {
      // The moment was deleted while queued.
      await (_db.delete(_db.cloudJob)..where((j) => j.id.equals(job.id))).go();
      return;
    }
    final p = Pseudonymizer(snapshot.people).labelRequest(snapshot.moment, purpose: snapshot.purpose, wantTitle: true);
    final result = await _analyzer.analyze(p.request);
    switch (result) {
      case Ok(:final value):
        final dropped = await _store(job.targetId, snapshot, p, value);
        await _setJob(job.id, status: 'done', attempts: job.attempts + 1);
        _log.event('moment_analyzed', {'count': value.items.length - dropped});
        if (dropped > 0) _log.event('item_dropped_no_source', {'count': dropped});
      case Err(:final error):
        await _fail(job, error);
    }
  }

  Future<void> _fail(CloudJobData job, GatewayFailure f) async {
    final attempts = job.attempts + 1;
    final now = clock.now();
    _log.event('cloud_job_failed', {'code': f.code, 'attempt': attempts});
    switch (f.code) {
      case 'quota_exceeded':
        // Blocked until the next day (§12.7).
        final tomorrow = DateTime(now.year, now.month, now.day + 1);
        await _setJob(job.id, status: 'queued', attempts: attempts, error: f.code, nextAt: tomorrow);
        await _setMoment(job.targetId, 'pending');
      case 'analysis_disabled' || 'upgrade_required':
        await _setJob(job.id, status: 'blocked', attempts: attempts, error: f.code);
        await _setMoment(job.targetId, 'pending');
      case 'model_refused' || 'invalid_request' || 'body_too_large':
        await _setJob(job.id, status: 'failed', attempts: attempts, error: f.code);
        await _setMoment(job.targetId, 'failed');
      default:
        final limit = f.code == 'model_output_invalid' ? maxInvalidAttempts : maxAttempts;
        if (!f.retryable || attempts >= limit) {
          await _setJob(job.id, status: 'failed', attempts: attempts, error: f.code);
          await _setMoment(job.targetId, 'failed');
          return;
        }
        final wait = f.retryAfter ?? (attempts <= backoff.length ? backoff[attempts - 1] : const Duration(hours: 1));
        await _setJob(job.id, status: 'queued', attempts: attempts, error: f.code, nextAt: now.add(wait));
        await _setMoment(job.targetId, 'pending');
    }
  }

  /// Writes the analysis in one transaction. Re-analysis replaces model items the user
  /// has not touched (§8.7). Returns how many items failed the client citation check.
  Future<int> _store(String momentId, MomentSnapshot snap, Pseudonymized p, MomentLabelResponse res) {
    final m = p.mapping;
    final now = clock.now().millisecondsSinceEpoch;
    final speakerTokenOf = {for (final u in p.request.utterances) u.id: u.speaker};
    return _db.transaction(() async {
      await _db.customStatement(
        "DELETE FROM item WHERE moment_id = ? AND origin = 'model' AND user_edited = 0 AND status = 'open' "
        'AND NOT EXISTS (SELECT 1 FROM feedback f WHERE f.item_id = item.id)',
        [momentId],
      );
      var dropped = 0;
      for (final item in res.items) {
        // I9, client side: every source must be a line of this moment that still exists.
        final sources = [
          for (final alias in item.sources)
            if (m.utteranceId(alias) case final id? when snap.lines.containsKey(id)) (alias, id),
        ];
        if (sources.isEmpty) {
          dropped++;
          continue;
        }
        final (ownerSpeaker, ownerPerson) = item.owner == null ? (null, null) : m.resolve(item.owner!);
        final (counterSpeaker, counterPerson) = item.counterpart == null ? (null, null) : m.resolve(item.counterpart!);
        // A first-person promise follows its line if the line is reassigned (§8.5).
        final ownerLine = ownerSpeaker == null
            ? null
            : sources.where((s) => speakerTokenOf[s.$1] == item.owner).firstOrNull?.$2;
        final lines = [for (final s in sources) snap.lines[s.$2]!];
        final speakerConf = lines.map((l) => l.speakerConfidence ?? 1.0).reduce(math.min);
        final asrConf = lines.map((l) => l.asrConfidence ?? 1.0).reduce((a, b) => a + b) / lines.length;
        final itemId = newId();
        await _db
            .into(_db.item)
            .insert(
              ItemCompanion.insert(
                id: itemId,
                momentId: momentId,
                type: itemTypeValues.reverse[item.type]!,
                text$: m.restore(item.text),
                ownerSpeakerId: Value(ownerSpeaker),
                ownerPersonId: Value(ownerPerson),
                ownerFromUtteranceId: Value(ownerLine),
                counterpartSpeakerId: Value(counterSpeaker),
                counterpartPersonId: Value(counterPerson),
                dueDate: Value(item.due?.date),
                duePhrase: Value(item.due?.phrase),
                // Set once the client due-date parser exists (§8.5).
                dueCheck: const Value(null),
                confidence: item.confidence * speakerConf * asrConf,
                origin: 'model',
                createdAt: now,
                updatedAt: now,
              ),
            );
        for (final (_, utteranceId) in sources) {
          await _db.into(_db.itemSource).insert(ItemSourceCompanion.insert(itemId: itemId, utteranceId: utteranceId));
        }
      }
      await (_db.update(_db.moment)..where((x) => x.id.equals(momentId))).write(
        MomentCompanion(
          sceneLabel: Value(res.scene.label),
          labelConfidence: Value(res.scene.confidence),
          title: Value(res.title == null ? null : m.restore(res.title!)),
          summary: Value(m.restore(res.summary)),
          tone: Value(toneValues.reverse[res.tone]),
          analysisStatus: const Value('done'),
          analyzerVersion: Value(res.modelVersion),
        ),
      );
      return dropped;
    });
  }

  Future<void> _setJob(String id, {required String status, int? attempts, String? error, DateTime? nextAt}) =>
      (_db.update(_db.cloudJob)..where((j) => j.id.equals(id))).write(
        CloudJobCompanion(
          status: Value(status),
          attempts: attempts == null ? const Value.absent() : Value(attempts),
          lastError: error == null ? const Value.absent() : Value(error),
          nextAttemptAt: nextAt == null ? const Value.absent() : Value(nextAt.millisecondsSinceEpoch),
        ),
      );

  Future<void> _setMoment(String id, String status) =>
      (_db.update(_db.moment)..where((m) => m.id.equals(id))).write(MomentCompanion(analysisStatus: Value(status)));
}
