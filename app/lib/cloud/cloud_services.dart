import 'package:clock/clock.dart';
import 'package:cloud_contracts/cloud_contracts.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart' show Supabase;

import '../core/flavor.dart';
import '../core/log.dart';
import '../data/database.dart';
import '../domain/analysis_queue.dart';
import '../domain/moment_loader.dart';
import 'config_repository.dart';
import 'device_registrar.dart';
import 'gateway_client.dart';
import 'moment_analyzer.dart';
import 'supabase_tokens.dart';

/// A fixed token for the local dev server. Dev flavor only.
class StaticTokens implements TokenSource {
  const StaticTokens(this.token);
  final String token;

  @override
  Future<String?> accessToken() async => token;

  @override
  Future<bool> refresh() async => false;
}

/// Everything that talks to the gateway. Null when the build has no gateway, so the
/// app runs fully offline.
class CloudServices {
  CloudServices._(this.client, this.registrar, this.config, this.queue);

  final GatewayClient client;
  final DeviceRegistrar registrar;
  final ConfigRepository config;
  final AnalysisQueue queue;

  static Future<CloudServices?> create({
    required AppEnv env,
    required AppDatabase db,
    required Clock clock,
    required Log log,
    double uncertainBelow = 0.6,
  }) async {
    final base = env.gatewayBase;
    if (base == null) return null;
    final TokenSource tokens;
    if (env.devToken != null && env.flavor == Flavor.dev) {
      tokens = StaticTokens(env.devToken!);
    } else if (env.supabaseUrl != null && env.supabaseAnonKey != null) {
      await Supabase.initialize(url: env.supabaseUrl!, publishableKey: env.supabaseAnonKey!);
      tokens = SupabaseTokens(Supabase.instance.client.auth);
    } else {
      return null;
    }
    final registrar = DeviceRegistrar(
      db,
      platform: kIsWeb ? Platform.WEB : Platform.IOS,
      appVersion: env.appVersion,
      osVersion: kIsWeb ? 'web' : defaultTargetPlatform.name,
    );
    late final GatewayClient client;
    client = GatewayClient(
      base: base,
      httpClient: http.Client(),
      tokens: tokens,
      appVersion: env.appVersion,
      deviceId: registrar.deviceId,
      registerDevice: () => registrar.register(client),
    );
    final queue = AnalysisQueue(
      db,
      CloudMomentAnalyzer(client),
      MomentLoader(db, uncertainBelow: uncertainBelow),
      clock: clock,
      log: log,
    );
    return CloudServices._(client, registrar, ConfigRepository(db, clock), queue);
  }

  /// At launch: register the device if needed, refresh the config, apply the kill
  /// switch, and run any analysis that is due.
  Future<void> start() async {
    if (await registrar.needsRegistration()) await registrar.register(client);
    final config = await this.config.refreshIfStale(client);
    if (config.analysisEnabled) await queue.unblock();
    await queue.runDue();
  }
}
