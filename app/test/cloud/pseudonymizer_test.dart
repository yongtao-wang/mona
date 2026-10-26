import 'dart:convert';
import 'dart:math';

import 'package:cloud_contracts/cloud_contracts.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/cloud/pseudonymizer.dart';

const self = NamedPerson(id: 'p-self', displayName: 'Mia Lin', aliases: ['林美雅', 'Mia'], isSelf: true);
const alex = NamedPerson(id: 'p-alex', displayName: 'Alex Chen', aliases: ['陳怡君']);
const wang = NamedPerson(id: 'p-wang', displayName: '王小明', aliases: ['Ming']);

MomentForLabel moment(List<MomentLine> lines, {List<MomentSpeaker>? speakers}) => MomentForLabel(
  id: 'moment-uuid',
  localDate: '2026-10-27',
  localStart: '10:00',
  tz: 'Asia/Taipei',
  durationS: 1260,
  languages: const ['en', 'zh-TW'],
  sceneHint: SceneHint.MEETING,
  speakers:
      speakers ??
      const [
        MomentSpeaker(id: 'spk-me', isSelf: true, personId: 'p-self'),
        MomentSpeaker(id: 'spk-b', personId: 'p-alex'),
        MomentSpeaker(id: 'spk-c'),
      ],
  lines: lines,
);

MomentLine line(String id, String? speaker, String text, {int at = 0}) =>
    MomentLine(id: id, speakerId: speaker, startMs: at, text: text);

String payload(Pseudonymized p) => jsonEncode(p.request.toJson());

/// Whether [variant] still appears in [text], with the matcher's own rules: Latin
/// names as whole words, case-insensitive; CJK names as substrings.
bool leaks(String text, String variant) {
  if (RegExp(r'\p{Script=Han}', unicode: true).hasMatch(variant)) return text.contains(variant);
  return RegExp(
    '(?<![\\p{L}\\p{N}])${RegExp.escape(variant)}(?![\\p{L}\\p{N}])',
    caseSensitive: false,
    unicode: true,
  ).hasMatch(text);
}

void main() {
  test('speakers get ME and S tokens in order of first appearance; ids become aliases', () {
    final p = Pseudonymizer([self, alex, wang]).labelRequest(
      moment([
        line('uuid-1', 'spk-c', 'Can we lock the spec by Friday?'),
        line('uuid-2', 'spk-me', "I'll send the draft to Alex by Thursday.", at: 4000),
        line('uuid-3', 'spk-b', '好，我跟王經理說', at: 9000),
      ]),
      purpose: LabelPurpose.MINUTES,
    );
    final r = p.request;
    expect(r.participants, ['S1', 'ME', 'S2']);
    expect(r.mentioned, ['P1']);
    expect(r.utterances.map((u) => (u.id, u.speaker, u.t)), [('u1', 'S1', 0), ('u2', 'ME', 4), ('u3', 'S2', 9)]);
    // A named speaker's name maps to that speaker's token; a non-speaker gets a P token.
    expect(r.utterances[1].text, "I'll send the draft to S2 by Thursday.");
    expect(r.utterances[2].text, '好，我跟P1說');
    expect(r.moment.ref, 'm1');
    expect(payload(p), isNot(contains('uuid')));

    expect(p.mapping.utteranceId('u2'), 'uuid-2');
    expect(p.mapping.resolve('S2'), ('spk-b', null));
    expect(p.mapping.resolve('P1'), (null, 'p-wang'));
    expect(
      p.mapping.restore('ME will send the draft to S2; P1 approves'),
      '{{spk:spk-me}} will send the draft to {{spk:spk-b}}; {{per:p-wang}} approves',
    );
  });

  test('CJK names: given name, family name + title and pinyin homophones match; the family name alone does not', () {
    final p = Pseudonymizer([alex])
        .labelRequest(moment([line('u', 'spk-c', '陳宜君說怡君會找陳經理，陳述一下')]), purpose: LabelPurpose.LABEL);
    // 陳宜君 is an ASR spelling of 陳怡君 (same toneless pinyin).
    expect(p.request.utterances.single.text, 'S2說S2會找S2，陳述一下');
  });

  test('Latin names match as whole words, case-insensitively, with possessives', () {
    final p = Pseudonymizer([alex]).labelRequest(
      moment([line('u', 'spk-me', "alex's doc, Alexander's plan, ALEX CHEN agreed")]),
      purpose: LabelPurpose.LABEL,
    );
    expect(p.request.utterances.single.text, "S1's doc, Alexander's plan, S1 agreed");
  });

  test('the self person is ME even without a self speaker in the moment', () {
    final p = Pseudonymizer([self]).labelRequest(
      moment([line('u', 'spk-c', 'Mia will book the room')], speakers: const [MomentSpeaker(id: 'spk-c')]),
      purpose: LabelPurpose.LABEL,
    );
    expect(p.request.utterances.single.text, 'ME will book the room');
    expect(p.mapping.restore('ME'), '{{per:p-self}}');
  });

  test('emails, phones, Taiwan IDs and cards become numbered tokens and restore exactly', () {
    const text =
        'Mail mia.lin@example.com or call 0912-345-678, +886 912 345 678, (415) 555-0134 or 02 2345 6789. '
        'ID A123456789, card 4111 1111 1111 1111, order 1234567890123. Mail mia.lin@example.com again.';
    final p = Pseudonymizer(const []).labelRequest(moment([line('u', 'spk-me', text)]), purpose: LabelPurpose.LABEL);
    final out = p.request.utterances.single.text;
    expect(
      out,
      'Mail <EMAIL_1> or call <PHONE_1>, <PHONE_2>, <PHONE_3> or <PHONE_4>. '
      'ID <ID_1>, card <CARD_1>, order 1234567890123. Mail <EMAIL_1> again.',
    );
    expect(p.mapping.restore(out), text);
  });

  test('I4: no display name, alias or generated variant survives in any outgoing payload', () {
    final rnd = Random(4);
    const latinFirst = ['Alex', 'Jordan', 'Priya', 'Mateo', 'Hana', 'Grace', 'Noah', 'Ivy'];
    const latinLast = ['Chen', 'Garcia', 'Okafor', 'Nguyen', 'Smith', 'Patel'];
    const family = ['陳', '林', '黃', '張', '李', '王', '吳', '劉'];
    const given = ['怡君', '志明', '雅婷', '家豪', '淑芬', '冠宇', '美玲', '俊傑'];
    const filler = [
      'we should ship the beta',
      'the budget is fine',
      '我們明天要 sync 一下 spec',
      '這週先不要改 API',
      'can you send it before lunch',
      '好，那就這樣',
    ];

    for (var round = 0; round < 200; round++) {
      final people = <NamedPerson>[
        for (var i = 0; i < 4; i++)
          NamedPerson(
            id: 'p$i',
            displayName: rnd.nextBool()
                ? '${latinFirst[rnd.nextInt(latinFirst.length)]} ${latinLast[rnd.nextInt(latinLast.length)]}'
                : '${family[rnd.nextInt(family.length)]}${given[rnd.nextInt(given.length)]}',
            aliases: [
              if (rnd.nextBool()) '${family[rnd.nextInt(family.length)]}${given[rnd.nextInt(given.length)]}',
              if (rnd.nextBool()) latinFirst[rnd.nextInt(latinFirst.length)],
            ],
            isSelf: i == 0,
          ),
      ];
      final variants = {for (final p in people) ...Pseudonymizer.variantsOf(p)}.toList();
      String sentence() {
        final parts = <String>[filler[rnd.nextInt(filler.length)]];
        for (var k = 0; k < 3; k++) {
          var name = variants[rnd.nextInt(variants.length)];
          if (rnd.nextBool()) name = name.toUpperCase();
          parts.insert(rnd.nextInt(parts.length + 1), rnd.nextBool() ? "$name's" : name);
        }
        return parts.join(rnd.nextBool() ? ' ' : '，');
      }

      final lines = [
        for (var j = 0; j < 6; j++) line('u$j', ['spk-me', 'spk-b', 'spk-c'][j % 3], sentence()),
      ];
      final speakers = [
        const MomentSpeaker(id: 'spk-me', isSelf: true, personId: 'p0'),
        MomentSpeaker(id: 'spk-b', personId: rnd.nextBool() ? 'p1' : null),
        const MomentSpeaker(id: 'spk-c'),
      ];
      final out = payload(
        Pseudonymizer(people).labelRequest(moment(lines, speakers: speakers), purpose: LabelPurpose.LABEL),
      );
      final texts = (jsonDecode(out)['utterances'] as List).map((u) => (u as Map)['text'] as String).join('\n');
      for (final v in variants) {
        expect(leaks(texts, v), isFalse, reason: 'round $round leaked "$v" in:\n$texts');
      }
    }
  });

  test('the request validates against the contract', () {
    final p = Pseudonymizer([self, alex])
        .labelRequest(moment([line('u', 'spk-me', 'hello Alex')]), purpose: LabelPurpose.LABEL);
    final roundTrip = MomentLabelRequest.fromJson(jsonDecode(payload(p)) as Map<String, dynamic>);
    expect(roundTrip.utterances.single.text, 'hello S1');
  });
}
