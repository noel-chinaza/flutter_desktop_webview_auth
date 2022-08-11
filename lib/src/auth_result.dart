class AuthResult {
  final String? accessToken;
  final String? idToken;
  final String? tokenSecret;
  final String? code;
  final int? expiresIn;
  final String? refreshToken;
  final String? scope;
  final String? tokenType;

  AuthResult({
    this.accessToken,
    this.idToken,
    this.tokenSecret,
    this.code,
    this.expiresIn,
    this.refreshToken,
    this.scope,
    this.tokenType,
  });

  @override
  String toString() {
    return 'AuthResult(idToken: $idToken, accessToken: $accessToken, tokenSecret: $tokenSecret, code: $code, expires_in: $expiresIn, refreshToken: $refreshToken, scope: $scope, tokenType: $tokenType)';
  }

  factory AuthResult.fromJson(Map<String, dynamic> json) {
    return AuthResult(
      accessToken: json["access_token"] ?? "",
      idToken: json["id_token"] ?? "",
      tokenSecret: json["token_secret"] ?? "",
      code: json["code"] ?? "",
      expiresIn: json["expires_in"] ?? 0,
      refreshToken: json["refresh_token"] ?? "",
      scope: json["scope"] ?? "",
      tokenType: json["token_type"] ?? "",
    );
  }
}
