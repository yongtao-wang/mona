import '../data/database.dart';

/// Renders stored `{{spk:id}}` and `{{per:id}}` placeholders with current names (spec
/// §8.4 step 6, D14), so a rename or speaker fix shows everywhere without a cloud call.
class PlaceholderRenderer {
  PlaceholderRenderer._(this._speakers, this._people);

  final Map<String, SpeakerData> _speakers;
  final Map<String, PersonData> _people;

  static final _pattern = RegExp(r'\{\{(spk|per):([^}]+)\}\}');

  static Future<PlaceholderRenderer> load(AppDatabase db) async => PlaceholderRenderer._(
    {for (final s in await db.select(db.speaker).get()) s.id: s},
    {for (final p in await db.select(db.person).get()) p.id: p},
  );

  /// [you] and [speaker] name a speaker who has no person: the user, or "Speaker B".
  String render(String text, {required String you, required String Function(String label) speaker}) =>
      text.replaceAllMapped(_pattern, (m) {
        if (m[1] == 'per') return _people[m[2]]?.displayName ?? '?';
        var s = _speakers[m[2]];
        // Merged speakers resolve through merged_into (§8.7).
        for (var hops = 0; s?.mergedInto != null && hops < 8; hops++) {
          s = _speakers[s!.mergedInto];
        }
        if (s == null) return '?';
        if (s.isSelf == 1) return you;
        final person = s.personId == null ? null : _people[s.personId];
        return person?.displayName ?? speaker(s.label);
      });
}
