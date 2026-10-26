import 'dart:convert';

import 'package:clock/clock.dart';
import 'package:cloud_contracts/cloud_contracts.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/cloud/gateway_client.dart';
import 'package:mona/cloud/moment_analyzer.dart';
import 'package:mona/core/result.dart';
import 'package:mona/data/database.dart';
import 'package:mona/domain/analysis_queue.dart';
import 'package:mona/domain/moment_loader.dart';
import 'package:mona/domain/sample_day.dart';

import '../helpers.dart';

/// Returns scripted results and keeps every request it was sent.
class FakeAnalyzer implements MomentAnalyzer {
  final requests = <MomentLabelRequest>[];
  final results = <Result<MomentLabelResponse, GatewayFailure>>[];

  @override
  Future<Result<MomentLabelResponse, GatewayFailure>> analyze(MomentLabelRequest request) async {
    requests.add(request);
    return results.removeAt(0);
  }
}

MomentLabelResponse response(List<Map<String, dynamic>> items) => MomentLabelResponse.fromJson({
  'scene': {'label': 'meeting', 'confidence': 0.9},
  'tone': 'neutral',
  'title': 'Spec lock with S1',
  'summary': 'ME will send the draft to S1; P1 wants v2.',
  'items': items,
  'minutes': null,
  'model_version': 'label-v1/test',
});

Map<String, dynamic> item(String id, String type, List<String> sources, {String? owner, String? counterpart}) => {
  'id': id,
  'type': type,
  'text': 'Send the draft to S1',
  'owner': owner,
  'counterpart': counterpart,
  'due': {'phrase': 'by Thursday', 'date': '2026-10-29'},
  'sources': sources,
  'confidence': 0.8,
};

void main() {
  late AppDatabase db;
  late FakeAnalyzer analyzer;
  late AnalysisQueue queue;
  late String momentId;
  var now = DateTime(2026, 10, 27, 11);

  setUp(() async {
    now = DateTime(2026, 10, 27, 11);
    db = openTestDb();
    analyzer = FakeAnalyzer();
    final clock = Clock(() => now);
    queue = AnalysisQueue(db, analyzer, MomentLoader(db), clock: clock);
    momentId = await SampleDay(db, clock).addMeetingToAnalyze();
    await queue.enqueue(momentId);
  });
  tearDown(() => db.close());

  Future<CloudJobData> job() => db.select(db.cloudJob).getSingle();
  Future<MomentData> moment() => (db.select(db.moment)..where((m) => m.id.equals(momentId))).getSingle();

  test('I4: the request that leaves the phone has no names, numbers or local ids', () async {
    analyzer.results.add(Ok(response([])));
    await queue.runDue();
    final payload = jsonEncode(analyzer.requests.single.toJson());
    for (final leak in ['Mia', 'Alex', 'Wang', 'Xiaoming', '0912-345-678', momentId]) {
      expect(payload, isNot(contains(leak)), reason: leak);
    }
    final r = analyzer.requests.single;
    expect(r.options.purpose, LabelPurpose.MINUTES); // a meeting session
    expect(r.participants, ['S1', 'ME', 'S2']);
    expect(r.utterances[1].text, "I'll send the draft to S2 by Thursday.");
    expect(r.utterances[2].text, 'Sure. P1 wants the API to stay on v2 for now.');
    expect(r.utterances[4].text, contains('<PHONE_1>'));
    expect(r.utterances[4].uncertain, isTrue); // speaker confidence below τ_uncertain
  });

  test('a result is stored with placeholders, local ids and composite confidence', () async {
    analyzer.results.add(
      Ok(
        response([
          item('i1', 'promise', ['u2'], owner: 'ME', counterpart: 'S2'),
        ]),
      ),
    );
    await queue.runDue();

    final m = await moment();
    expect(m.analysisStatus, 'done');
    expect(m.analyzerVersion, 'label-v1/test');
    expect(m.title, matches(RegExp(r'^Spec lock with \{\{spk:[0-9a-f-]+\}\}$')));
    expect(m.summary, matches(RegExp(r'\{\{per:[0-9a-f-]+\}\} wants v2')));

    final stored = await db.select(db.item).getSingle();
    final me = await (db.select(db.speaker)..where((s) => s.isSelf.equals(1))).getSingle();
    final line2 = (await (db.select(db.utterance)..where((u) => u.momentId.equals(momentId))).get())
      ..sort((a, b) => a.startMs.compareTo(b.startMs));
    expect(stored.ownerSpeakerId, me.id);
    expect(stored.ownerFromUtteranceId, line2[1].id); // first-person promise follows its line
    expect(stored.counterpartSpeakerId, isNotNull);
    expect((stored.dueDate, stored.duePhrase), ('2026-10-29', 'by Thursday'));
    expect(stored.confidence, closeTo(0.8 * 0.9 * 0.95, 1e-9));
    expect(stored.text$, startsWith('Send the draft to {{spk:'));
    expect((await job()).status, 'done');
  });

  test('I9: items citing lines the phone does not hold are dropped on the client too', () async {
    analyzer.results.add(
      Ok(
        response([
          item('i1', 'promise', ['u2']),
          item('i2', 'fact', ['u99']),
        ]),
      ),
    );
    await queue.runDue();
    final items = await db.select(db.item).get();
    expect(items, hasLength(1));
    final sources = await db.select(db.itemSource).get();
    expect(sources.single.itemId, items.single.id);
  });

  test('re-analysis replaces untouched model items and keeps edited ones (§8.7)', () async {
    analyzer.results.add(
      Ok(
        response([
          item('i1', 'promise', ['u2']),
          item('i2', 'question', ['u4']),
        ]),
      ),
    );
    await queue.runDue();
    final first = await db.select(db.item).get();
    await (db.update(
      db.item,
    )..where((i) => i.id.equals(first.first.id))).write(const ItemCompanion(userEdited: Value(1)));
    analyzer.results.add(
      Ok(
        response([
          item('i1', 'decision', ['u4']),
        ]),
      ),
    );
    await queue.enqueue(momentId);
    await queue.runDue();
    final after = await db.select(db.item).get();
    expect(after.map((i) => i.id), contains(first.first.id));
    expect(after, hasLength(2));
  });

  test('retryable failures back off 10 s, 1 min, 5 min, 30 min, and fail after 5 attempts', () async {
    final waits = <Duration>[];
    for (var i = 0; i < 5; i++) {
      analyzer.results.add(const Err(GatewayFailure('network', retryable: true)));
      final before = now;
      expect(await queue.runDue(), 1);
      final j = await job();
      if (i < 4) {
        expect(j.status, 'queued');
        waits.add(DateTime.fromMillisecondsSinceEpoch(j.nextAttemptAt).difference(before));
        now = DateTime.fromMillisecondsSinceEpoch(j.nextAttemptAt);
      } else {
        expect((j.status, j.attempts, j.lastError), ('failed', 5, 'network'));
      }
    }
    expect(waits, AnalysisQueue.backoff);
    expect((await moment()).analysisStatus, 'failed');
  });

  test('Retry-After overrides the backoff; nothing runs before it is due', () async {
    analyzer.results.add(const Err(GatewayFailure('rate_limited', retryable: true, retryAfter: Duration(seconds: 42))));
    await queue.runDue();
    expect(DateTime.fromMillisecondsSinceEpoch((await job()).nextAttemptAt), now.add(const Duration(seconds: 42)));
    expect(await queue.runDue(), 0);
  });

  test('a refusal fails at once; the kill switch blocks until unblocked; quota waits for tomorrow', () async {
    analyzer.results.add(const Err(GatewayFailure('model_refused', retryable: false)));
    await queue.runDue();
    expect(((await job()).status, (await moment()).analysisStatus), ('failed', 'failed'));

    await queue.enqueue(momentId);
    analyzer.results.add(const Err(GatewayFailure('analysis_disabled', retryable: true)));
    await queue.runDue();
    expect((await job()).status, 'blocked');
    expect(await queue.runDue(), 0);
    await queue.unblock();
    analyzer.results.add(const Err(GatewayFailure('quota_exceeded', retryable: true)));
    await queue.runDue();
    final j = await job();
    expect((j.status, DateTime.fromMillisecondsSinceEpoch(j.nextAttemptAt)), ('queued', DateTime(2026, 10, 28)));
  });

  test('model_output_invalid is retried at most 3 times', () async {
    for (var i = 0; i < 3; i++) {
      analyzer.results.add(const Err(GatewayFailure('model_output_invalid', retryable: true)));
      await queue.runDue();
      now = DateTime.fromMillisecondsSinceEpoch((await job()).nextAttemptAt);
    }
    expect((await job()).status, 'failed');
  });
}
