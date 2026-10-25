import 'package:supabase_flutter/supabase_flutter.dart';

import 'gateway_client.dart';

/// Access tokens from Supabase Auth (spec §11.3); `supabase_flutter` refreshes them.
class SupabaseTokens implements TokenSource {
  SupabaseTokens(this._auth);

  final GoTrueClient _auth;

  @override
  Future<String?> accessToken() async => _auth.currentSession?.accessToken;

  @override
  Future<bool> refresh() async {
    try {
      return (await _auth.refreshSession()).session != null;
    } on AuthException {
      return false;
    }
  }
}
