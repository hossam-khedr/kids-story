enum AuthAdminStatus{init,loading,error,success,registerLoading,registerError,registerSuccess}

class AuthAdminState{
  final AuthAdminStatus status;
  final String errorMessage;

  AuthAdminState({
    this.status = AuthAdminStatus.init,
    this.errorMessage = '',
});

  bool get isLoading => status == AuthAdminStatus.loading;
  bool get isError => status == AuthAdminStatus.error;
  bool get isSuccess => status == AuthAdminStatus.success;
  bool get isRegisterLoading => status == AuthAdminStatus.registerLoading;
  bool get isRegisterError => status == AuthAdminStatus.registerError;
  bool get isRegisterSuccess => status == AuthAdminStatus.registerSuccess;

  AuthAdminState copyWith({
    final AuthAdminStatus? status,
    final String? errorMessage,
}){
    return AuthAdminState(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }


}