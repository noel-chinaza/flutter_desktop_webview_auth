import 'package:desktop_webview_auth/src/provider_args.dart';

class GoogleRefreshArgs extends ProviderArgs {
  GoogleRefreshArgs({
    required this.redirectUri,
    required this.clientId,
    required this.clientSecret,
    required this.grantType,
    this.code = '',
    this.refreshToken = '',
  });

  final String clientId;
  final String clientSecret;

  ///
  /// [GrantType] can be authorization_code or refresh_token
  ///
  final String grantType;

  ///
  /// Code from login when access_type=offline
  /// Set this when you need to request refresh_token and let refreshToken blank
  ///
  String code;

  ///
  /// Token result after you request refresh_token using ```code```
  /// Set this when you need a new ```access_token``` and let code blank
  ///
  String refreshToken;

  @override
  final host = 'https://oauth2.googleapis.com';

  @override
  final path = '/token';

  @override
  final String redirectUri;

  @override
  Map<String, String> buildQueryParameters() => {
        "client_id": clientId,
        "client_secret": clientSecret,
        "redirect_uri": redirectUri,
        "grant_type": grantType,
        if (code.isNotEmpty) "code": code,
        if (refreshToken.isNotEmpty) "refresh_token": refreshToken,
      };
}
