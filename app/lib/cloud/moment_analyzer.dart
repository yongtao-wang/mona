import 'package:cloud_contracts/cloud_contracts.dart';

import '../core/result.dart';
import 'gateway_client.dart';

/// Labels one moment (spec §8.3). The request is already pseudonymized.
abstract interface class MomentAnalyzer {
  Future<Result<MomentLabelResponse, GatewayFailure>> analyze(MomentLabelRequest request);
}

/// Phase 1 default (D5): `POST /v1/moments/label` through the gateway.
class CloudMomentAnalyzer implements MomentAnalyzer {
  CloudMomentAnalyzer(this._client);

  final GatewayClient _client;

  @override
  Future<Result<MomentLabelResponse, GatewayFailure>> analyze(MomentLabelRequest request) async {
    final res = await _client.post('/v1/moments/label', request.toJson());
    return switch (res) {
      Ok(:final value) => _parse(value),
      Err(:final error) => Err(error),
    };
  }

  static Result<MomentLabelResponse, GatewayFailure> _parse(Map<String, dynamic> json) {
    try {
      return Ok(MomentLabelResponse.fromJson(json));
    } on Object {
      // The gateway validated it; a mismatch means the app's contract is out of date.
      return const Err(GatewayFailure('model_output_invalid', retryable: false));
    }
  }
}
