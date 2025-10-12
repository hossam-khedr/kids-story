class ForgotPasswordResponse {
  final String message;
  final String code;

  ForgotPasswordResponse({required this.message, required this.code});

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordResponse(
        message: json['message'] as String,
        code: json['reset_token_demo'] as String,
      );
}
