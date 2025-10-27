
import '../../../data/responses/forgot_password_response.dart';

enum AuthStatus {
  init,
  registerLoading,
  registerError,
  registerSuccess,
  loginLoading,
  loginError,
  loginSuccess,
  forgotLoading,
  forgotError,
  forgotSuccess,
  resetSuccess,
  resetError,
  resetLading,
  otpSuccess,
  otpError,
  otpLading,
}

class AuthStates {
  final String errorMessage;
  final AuthStatus authStatus;
  final ForgotPasswordResponse? forgotPasswordResponse;
  final String? otpSuccessMessage;

  AuthStates({
    this.errorMessage = '',
    this.authStatus = AuthStatus.init,
    this.forgotPasswordResponse,
    this.otpSuccessMessage
  });

  bool get isRegisterLoading => authStatus == AuthStatus.registerLoading;

  bool get isRegisterError => authStatus == AuthStatus.registerError;

  bool get isRegisterSuccess => authStatus == AuthStatus.registerSuccess;

  bool get isLoginLoading => authStatus == AuthStatus.loginLoading;

  bool get isLoginError => authStatus == AuthStatus.loginError;

  bool get isLoginSuccess => authStatus == AuthStatus.loginSuccess;
  bool get isForgotSuccess => authStatus == AuthStatus.forgotSuccess;
  bool get isForgotLoading => authStatus == AuthStatus.forgotLoading;
  bool get isForgotError => authStatus == AuthStatus.forgotError;
  bool get isResetError => authStatus == AuthStatus.resetError;
  bool get isResetLoading => authStatus == AuthStatus.resetLading;
  bool get isResetSuccess => authStatus == AuthStatus.resetSuccess;
  bool get isOTPLading => authStatus == AuthStatus.otpLading;
  bool get isOTPError => authStatus == AuthStatus.otpError;
  bool get isOTPSuccess => authStatus == AuthStatus.otpSuccess;

  AuthStates copyWith({
    final String? errorMessage,
    final AuthStatus? authStatus,
    final ForgotPasswordResponse? forgotPasswordResponse,
    final String? otpSuccessMessage,
  }) {
    return AuthStates(
      errorMessage: errorMessage ?? this.errorMessage,
      authStatus: authStatus ?? this.authStatus,
      forgotPasswordResponse: forgotPasswordResponse ?? this.forgotPasswordResponse,
      otpSuccessMessage: otpSuccessMessage ?? this.otpSuccessMessage
    );
  }
}
