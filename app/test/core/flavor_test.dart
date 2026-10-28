import 'package:flutter_test/flutter_test.dart';
import 'package:mona/core/flavor.dart';

void main() {
  test('the gateway URL: absolute, same-origin, Supabase, or none', () {
    final origin = Uri.parse('https://mona-preview.vercel.app/');
    expect(
      const AppEnv(flavor: Flavor.dev, gatewayUrl: 'http://localhost:8787/gateway').gatewayBase(origin).toString(),
      'http://localhost:8787/gateway',
    );
    expect(
      const AppEnv(flavor: Flavor.dev, gatewayUrl: '/api/gateway').gatewayBase(origin).toString(),
      'https://mona-preview.vercel.app/api/gateway',
    );
    expect(
      const AppEnv(flavor: Flavor.alpha, supabaseUrl: 'https://p.supabase.co').gatewayBase(origin).toString(),
      'https://p.supabase.co/functions/v1/gateway',
    );
    expect(const AppEnv(flavor: Flavor.alpha).gatewayBase(origin), isNull);
  });
}
