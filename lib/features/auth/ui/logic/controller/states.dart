enum AuthStatus {
  init,
  registerLoading,
  registerError,
  registerSuccess,
  loginLoading,
  loginError,
  loginSuccess,
}

class AuthStates {
  final String errorMessage;
  final AuthStatus authStatus;

  AuthStates({this.errorMessage = '', this.authStatus = AuthStatus.init});

  bool get isRegisterLoading => authStatus == AuthStatus.registerLoading;

  bool get isRegisterError => authStatus == AuthStatus.registerError;

  bool get isRegisterSuccess => authStatus == AuthStatus.registerSuccess;
  bool get isLoginLoading => authStatus == AuthStatus.loginLoading;
  bool get isLoginError => authStatus == AuthStatus.loginError;
  bool get isLoginSuccess => authStatus == AuthStatus.loginSuccess;

  AuthStates copyWith({
    final String? errorMessage,
    final AuthStatus? authStatus,
  }) {
    return AuthStates(
      errorMessage: errorMessage ?? this.errorMessage,
      authStatus: authStatus ?? this.authStatus,
    );
  }
}
