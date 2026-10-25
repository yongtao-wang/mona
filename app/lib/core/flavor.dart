/// Build flavor (spec §5.2). Set with `--dart-define=FLAVOR=alpha`.
enum Flavor {
  dev,
  alpha,
  beta;

  static Flavor fromEnvironment() =>
      Flavor.values.asNameMap()[const String.fromEnvironment('FLAVOR', defaultValue: 'dev')] ?? Flavor.dev;
}

/// Build-time settings, all from `--dart-define`. With no gateway URL the app runs offline.
class AppEnv {
  const AppEnv({required this.flavor, this.supabaseUrl, this.supabaseAnonKey, this.appVersion = '0.1.0'});

  factory AppEnv.fromEnvironment() {
    String? opt(String v) => v.isEmpty ? null : v;
    return AppEnv(
      flavor: Flavor.fromEnvironment(),
      supabaseUrl: opt(const String.fromEnvironment('SUPABASE_URL')),
      supabaseAnonKey: opt(const String.fromEnvironment('SUPABASE_ANON_KEY')),
    );
  }

  final Flavor flavor;
  final String? supabaseUrl;
  final String? supabaseAnonKey;
  final String appVersion;

  Uri? get gatewayBase => supabaseUrl == null ? null : Uri.parse('$supabaseUrl/functions/v1/gateway');
}
