import 'package:cloud_contracts/cloud_contracts.dart';
import 'package:pinyin/pinyin.dart';

/// A person whose name must not leave the phone (spec §8.4 step 4): the self person,
/// named speakers, calendar attendees and every `person` row.
class NamedPerson {
  const NamedPerson({required this.id, required this.displayName, this.aliases = const [], this.isSelf = false});

  final String id;
  final String displayName;
  final List<String> aliases;
  final bool isSelf;
}

/// A speaker lane in the moment's session.
class MomentSpeaker {
  const MomentSpeaker({required this.id, this.isSelf = false, this.personId});

  final String id;
  final bool isSelf;
  final String? personId;
}

class MomentLine {
  const MomentLine({
    required this.id,
    required this.speakerId,
    required this.startMs,
    required this.text,
    this.uncertain = false,
  });

  final String id;

  /// Null when diarization has not assigned the line yet; sent as the self token only
  /// if [MomentSpeaker.isSelf], otherwise as an unknown speaker `S0`.
  final String? speakerId;

  /// Milliseconds from the moment's start.
  final int startMs;
  final String text;
  final bool uncertain;
}

class MomentForLabel {
  const MomentForLabel({
    required this.id,
    required this.localDate,
    required this.localStart,
    required this.tz,
    required this.durationS,
    required this.languages,
    required this.speakers,
    required this.lines,
    this.sceneHint,
  });

  final String id;
  final String localDate;
  final String localStart;
  final String tz;
  final int durationS;
  final List<String> languages;
  final SceneHint? sceneHint;
  final List<MomentSpeaker> speakers;
  final List<MomentLine> lines;
}

/// The outgoing request and the in-memory mapping that turns the response back into
/// local ids and placeholders. The mapping is never stored (§8.4 step 1).
class Pseudonymized {
  Pseudonymized(this.request, this.mapping);

  final MomentLabelRequest request;
  final PseudonymMapping mapping;
}

class PseudonymMapping {
  PseudonymMapping._();

  final _speakerByToken = <String, String>{};
  final _personByToken = <String, String>{};
  final _utteranceByAlias = <String, String>{};
  final _momentByAlias = <String, String>{};
  final _patternByToken = <String, String>{};

  String? utteranceId(String alias) => _utteranceByAlias[alias];
  String? momentId(String alias) => _momentByAlias[alias];

  /// The speaker or person a token stands for: `(speakerId, null)` or `(null, personId)`.
  (String?, String?) resolve(String token) => (_speakerByToken[token], _personByToken[token]);

  /// Model text back to stored form: speaker and person tokens become `{{spk:id}}` and
  /// `{{per:id}}` placeholders, pattern tokens become the original text (§8.4 step 6).
  String restore(String text) => text
      .replaceAllMapped(_patternToken, (m) => _patternByToken[m[0]!] ?? m[0]!)
      .replaceAllMapped(_speakerTokenPattern, (m) {
        final token = m[0]!;
        if (_speakerByToken[token] case final id?) return '{{spk:$id}}';
        if (_personByToken[token] case final id?) return '{{per:$id}}';
        return token;
      });

  static final _patternToken = RegExp(r'<(EMAIL|PHONE|ID|CARD)_\d+>');
  static final _speakerTokenPattern = RegExp(r'(?<![A-Za-z0-9_])(ME|S\d{1,3}|P\d{1,3})(?![A-Za-z0-9_])');
}

/// Replaces names, ids and contact details before a moment leaves the phone (I4,
/// spec §8.4). Tokens are scoped to this one request.
class Pseudonymizer {
  Pseudonymizer(this.people);

  /// Every candidate name: the self person, named speakers, attendees, all `person` rows.
  final List<NamedPerson> people;

  /// Titles that, after a family name, refer to a person (§8.4 step 4).
  static const cjkTitles = ['經理', '小姐', '先生', '老師'];

  Pseudonymized labelRequest(MomentForLabel moment, {required LabelPurpose purpose, bool wantTitle = true}) {
    final mapping = PseudonymMapping._();
    final tokens = _Tokens(mapping, people);
    mapping._momentByAlias['m1'] = moment.id;

    final speakers = {for (final s in moment.speakers) s.id: s};
    // Speaker tokens in order of first appearance; the user is always ME.
    for (final line in moment.lines) {
      final s = speakers[line.speakerId];
      if (s != null) tokens.speaker(s);
    }

    final patterns = _Patterns(mapping);
    final matcher = _NameMatcher(people);
    final utterances = <LabelUtterance>[];
    for (final (i, line) in moment.lines.indexed) {
      final alias = 'u${i + 1}';
      mapping._utteranceByAlias[alias] = line.id;
      final speaker = speakers[line.speakerId];
      var text = patterns.replace(line.text);
      text = matcher.replace(text, (personId) => tokens.forPerson(personId, speakers.values));
      utterances.add(
        LabelUtterance(
          id: alias,
          speaker: speaker == null ? 'S0' : tokens.speaker(speaker),
          t: line.startMs ~/ 1000,
          text: text,
          uncertain: line.uncertain,
        ),
      );
    }

    final request = MomentLabelRequest(
      schemaVersion: 1,
      moment: LabelMoment(
        ref: 'm1',
        sceneHint: moment.sceneHint,
        localDate: moment.localDate,
        localStart: moment.localStart,
        tz: moment.tz,
        durationS: moment.durationS,
        languages: moment.languages,
      ),
      participants: tokens.participants,
      mentioned: tokens.mentioned,
      utterances: utterances,
      options: LabelOptions(purpose: purpose, wantTitle: wantTitle),
    );
    return Pseudonymized(request, mapping);
  }

  /// Every string that must never appear in an outgoing payload for [person]: the
  /// display name, aliases and generated variants (for tests and the eval harness).
  static List<String> variantsOf(NamedPerson person) => _NameMatcher.variants(person).toList();
}

class _Tokens {
  _Tokens(this.mapping, this.people);

  final PseudonymMapping mapping;
  final List<NamedPerson> people;
  final participants = <String>[];
  final mentioned = <String>[];
  final _bySpeaker = <String, String>{};
  final _byPerson = <String, String>{};

  String speaker(MomentSpeaker s) {
    final existing = _bySpeaker[s.id];
    if (existing != null) return existing;
    final token = s.isSelf ? 'ME' : 'S${_bySpeaker.values.where((t) => t.startsWith('S')).length + 1}';
    _bySpeaker[s.id] = token;
    mapping._speakerByToken[token] = s.id;
    participants.add(token);
    if (s.personId != null) _byPerson[s.personId!] = token;
    return token;
  }

  /// A named speaker's name maps to its speaker token; the self person to ME; anyone
  /// else to a P token, in order of first mention.
  String forPerson(String personId, Iterable<MomentSpeaker> speakers) {
    final existing = _byPerson[personId];
    if (existing != null) return existing;
    final named = speakers.where((s) => s.personId == personId).firstOrNull;
    if (named != null) return _byPerson[personId] = speaker(named);
    final person = people.firstWhere((p) => p.id == personId);
    if (person.isSelf) {
      final self = speakers.where((s) => s.isSelf).firstOrNull;
      if (self != null) return _byPerson[personId] = speaker(self);
      mapping._personByToken['ME'] = personId;
      return _byPerson[personId] = 'ME';
    }
    final token = 'P${mentioned.length + 1}';
    mentioned.add(token);
    mapping._personByToken[token] = personId;
    return _byPerson[personId] = token;
  }
}

/// Emails, phone numbers, Taiwan ID numbers and payment cards become numbered tokens
/// (§8.4 step 5). The same value always gets the same token within a request.
class _Patterns {
  _Patterns(this.mapping);

  final PseudonymMapping mapping;
  final _tokenByValue = <String, String>{};
  final _counts = <String, int>{};

  static final _email = RegExp(r'[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}');
  static final _card = RegExp(r'(?<!\d)(?:\d[ -]?){12,18}\d(?!\d)');
  static final _twId = RegExp(r'(?<![A-Za-z0-9])[A-Z][12A-D89]\d{8}(?!\d)');
  static final _phones = [
    RegExp(r'\+886[- ]?9\d{2}[- ]?\d{3}[- ]?\d{3}(?!\d)'), // Taiwan mobile, international
    RegExp(r'(?<!\d)09\d{2}[- ]?\d{3}[- ]?\d{3}(?!\d)'), // Taiwan mobile
    RegExp(r'(?:\+886[- ]?|(?<!\d)0)[2-8][- ]?\d{3,4}[- ]?\d{4}(?!\d)'), // Taiwan landline
    RegExp(r'(?:\+1[- .]?)?(?<!\d)\(?[2-9]\d{2}\)?[- .]?\d{3}[- .]\d{4}(?!\d)'), // North America (D30)
  ];

  String replace(String text) {
    // Earlier kinds win overlaps (an email before a phone inside it); tokens are then
    // numbered in reading order.
    final found = <(int, int, String)>[];
    bool free(Match m) => found.every((f) => m.end <= f.$1 || m.start >= f.$2);
    void collect(RegExp re, String kind, [bool Function(String)? accept]) {
      for (final m in re.allMatches(text)) {
        if (free(m) && (accept?.call(m[0]!) ?? true)) found.add((m.start, m.end, kind));
      }
    }

    collect(_email, 'EMAIL');
    collect(_card, 'CARD', _luhn);
    collect(_twId, 'ID');
    for (final p in _phones) {
      collect(p, 'PHONE');
    }
    if (found.isEmpty) return text;
    found.sort((a, b) => a.$1.compareTo(b.$1));
    final out = StringBuffer();
    var at = 0;
    for (final (start, end, kind) in found) {
      out
        ..write(text.substring(at, start))
        ..write(_token(kind, text.substring(start, end)));
      at = end;
    }
    return (out..write(text.substring(at))).toString();
  }

  String _token(String kind, String value) => _tokenByValue.putIfAbsent(value, () {
    final n = _counts[kind] = (_counts[kind] ?? 0) + 1;
    final token = '<${kind}_$n>';
    mapping._patternByToken[token] = value;
    return token;
  });

  static bool _luhn(String raw) {
    final digits = raw.replaceAll(RegExp(r'\D'), '');
    if (digits.length < 13 || digits.length > 19) return false;
    var sum = 0;
    for (var i = 0; i < digits.length; i++) {
      var d = digits.codeUnitAt(digits.length - 1 - i) - 48;
      if (i.isOdd) {
        d *= 2;
        if (d > 9) d -= 9;
      }
      sum += d;
    }
    return sum % 10 == 0;
  }
}

class _Variant {
  _Variant(this.text, this.personId) : cjk = _NameMatcher._isHan(text);

  final String text;
  final String personId;
  final bool cjk;
  late final RegExp latin = RegExp(
    '(?<![\\p{L}\\p{N}])${RegExp.escape(text)}(?![\\p{L}\\p{N}])',
    caseSensitive: false,
    unicode: true,
  );
  late final List<String> pinyin = cjk ? _NameMatcher._pinyinOf(text) : const [];
}

/// Finds known names in text, longest match first, and replaces them (§8.4 step 4).
class _NameMatcher {
  _NameMatcher(List<NamedPerson> people)
    : _variants = [
        for (final p in people)
          for (final v in variants(p)) _Variant(v, p.id),
      ]..sort((a, b) => b.text.length.compareTo(a.text.length));

  final List<_Variant> _variants;

  static Iterable<String> variants(NamedPerson p) sync* {
    final seen = <String>{};
    for (final name in [p.displayName, ...p.aliases]) {
      final n = name.trim();
      if (n.isEmpty) continue;
      if (_isHan(n)) {
        if (seen.add(n)) yield n;
        if (n.length >= 3) {
          // Compound family names are rare; a 4-character name is taken as 2 + 2.
          final familyLength = n.length == 4 ? 2 : 1;
          final family = n.substring(0, familyLength);
          final given = n.substring(familyLength);
          if (given.length >= 2 && seen.add(given)) yield given;
          for (final title in Pseudonymizer.cjkTitles) {
            if (seen.add('$family$title')) yield '$family$title';
          }
        }
        // A family name alone is never replaced: 陳 also appears in 陳述.
      } else {
        if (seen.add(n.toLowerCase())) yield n;
        final words = n.split(RegExp(r'\s+'));
        if (words.length > 1 && words.first.length >= 2 && seen.add(words.first.toLowerCase())) yield words.first;
      }
    }
  }

  String replace(String text, String Function(String personId) tokenFor) {
    // Collect every match, then keep the longest non-overlapping ones.
    final matches = <(int, int, String)>[];
    final textPinyin = _hasHan(text) ? _pinyinOf(text) : const <String>[];
    for (final v in _variants) {
      if (v.cjk) {
        for (var i = 0; i + v.text.length <= text.length; i++) {
          final span = text.substring(i, i + v.text.length);
          if (span == v.text || (_isHan(span) && _samePinyin(textPinyin, i, v.pinyin))) {
            matches.add((i, i + v.text.length, v.personId));
          }
        }
      } else {
        for (final m in v.latin.allMatches(text)) {
          matches.add((m.start, m.end, v.personId));
        }
      }
    }
    if (matches.isEmpty) return text;
    matches.sort((a, b) => (b.$2 - b.$1).compareTo(a.$2 - a.$1));
    final taken = List<bool>.filled(text.length, false);
    final chosen = <(int, int, String)>[];
    for (final m in matches) {
      if (taken.sublist(m.$1, m.$2).any((t) => t)) continue;
      for (var i = m.$1; i < m.$2; i++) {
        taken[i] = true;
      }
      chosen.add(m);
    }
    chosen.sort((a, b) => a.$1.compareTo(b.$1));
    // Tokens are assigned in reading order, so P1 is the first person mentioned.
    final buffer = StringBuffer();
    var at = 0;
    for (final (start, end, personId) in chosen) {
      buffer
        ..write(text.substring(at, start))
        ..write(tokenFor(personId));
      at = end;
    }
    buffer.write(text.substring(at));
    return buffer.toString();
  }

  static bool _samePinyin(List<String> text, int at, List<String> name) {
    if (at + name.length > text.length) return false;
    for (var i = 0; i < name.length; i++) {
      if (text[at + i] != name[i] || name[i].isEmpty) return false;
    }
    return true;
  }

  static final _han = RegExp(r'^\p{Script=Han}+$', unicode: true);
  static final _anyHan = RegExp(r'\p{Script=Han}', unicode: true);

  static bool _isHan(String s) => _han.hasMatch(s);
  static bool _hasHan(String s) => _anyHan.hasMatch(s);

  /// Toneless pinyin per UTF-16 unit; empty for anything that is not a Han character.
  static List<String> _pinyinOf(String s) => [
    for (final unit in s.split(''))
      _isHan(unit) ? PinyinHelper.getPinyinE(unit, defPinyin: '', format: PinyinFormat.WITHOUT_TONE) : '',
  ];
}
