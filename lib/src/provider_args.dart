import 'package:flutter/foundation.dart';

import 'auth_result.dart';
import 'jsonable.dart';

abstract class ProviderArgs implements JsonSerializable {
  String get redirectUri;
  String get host;
  String get path;

  Map<String, String> buildQueryParameters();

  Future<String> buildSignInUri() {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path: path,
      queryParameters: buildQueryParameters(),
    );

    return SynchronousFuture(uri.toString());
  }

  bool usesFragment = false;

  Future<AuthResult?> authorizeFromCallback(String callbackUrl) {
    final uri = Uri.parse(callbackUrl);
    late Map<String, String> args;

    if (usesFragment) {
      args = Uri.splitQueryString(uri.fragment);
    } else {
      args = uri.queryParameters;
    }

      final result = AuthResult(
        accessToken: args['access_token'],
        idToken: args['id_token'],
        code: args['code'],
        expiresIn: int.parse(args['expires_in'] ?? '0'),
        refreshToken: args['refresh_token'],
        scope: args['scope'],
        tokenType: args['token_type'],
        tokenSecret: args['token_secret'],
      );

      return SynchronousFuture(result);

  }

  @override
  Future<Map<String, String>> toJson() async {
    final signInUri = await buildSignInUri();

    return {
      'signInUri': signInUri,
      'redirectUri': redirectUri,
    };
  }
}
