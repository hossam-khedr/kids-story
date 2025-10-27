class ForgotPasswordResponse {
  final String message;
  final String code;
  final int codeHasExpired;

  ForgotPasswordResponse({
    required this.codeHasExpired,
    required this.message,
    required this.code,
  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordResponse(
        message: json['message'] as String,
        code: json['code'] as String,
        codeHasExpired: json['expires_in_minutes'] as int,
      );
}
