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
  const AppEnv({
    required this.flavor,
    this.supabaseUrl,
    this.supabaseAnonKey,
    this.gatewayUrl,
    this.devToken,
    this.appVersion = '0.1.0',
  });

  factory AppEnv.fromEnvironment() {
    String? opt(String v) => v.isEmpty ? null : v;
    return AppEnv(
      flavor: Flavor.fromEnvironment(),
      supabaseUrl: opt(const String.fromEnvironment('SUPABASE_URL')),
      supabaseAnonKey: opt(const String.fromEnvironment('SUPABASE_ANON_KEY')),
      gatewayUrl: opt(const String.fromEnvironment('GATEWAY_URL')),
      devToken: opt(const String.fromEnvironment('DEV_TOKEN')),
    );
  }

  final Flavor flavor;
  final String? supabaseUrl;
  final String? supabaseAnonKey;
  final String appVersion;

  /// A gateway outside Supabase, e.g. the local dev server (`deno task dev`).
  final String? gatewayUrl;

  /// Token the dev server accepts instead of a Supabase session. Dev flavor only.
  final String? devToken;

  /// A `GATEWAY_URL` starting with `/` is on the page's own origin (the hosted web
  /// preview, D33); [origin] defaults to `Uri.base`.
  Uri? gatewayBase([Uri? origin]) {
    if (gatewayUrl case final url?) {
      return url.startsWith('/') ? (origin ?? Uri.base).resolve(url) : Uri.parse(url);
    }
    return supabaseUrl == null ? null : Uri.parse('$supabaseUrl/functions/v1/gateway');
  }
}
