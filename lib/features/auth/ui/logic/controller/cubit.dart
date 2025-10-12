import 'package:kids_story_ai/app/index.dart';

class AuthCubit extends Cubit<AuthStates> {
  final AuthRepo authRepo;

  AuthCubit({required this.authRepo}) : super(AuthStates());

  Future<void> register(String name, String email, String password) async {
    emit(state.copyWith(authStatus: AuthStatus.registerLoading));
    (await authRepo.register(name, email, password)).fold(
      (failuer) => emit(
        state.copyWith(
          authStatus: AuthStatus.registerError,
          errorMessage: failuer.message,
        ),
      ),
      (success) => emit(state.copyWith(authStatus: AuthStatus.registerSuccess)),
    );
  }

  Future<void> login(String email, String password) async {
    emit(state.copyWith(authStatus: AuthStatus.loginLoading));
    (await authRepo.login(email, password)).fold(
      (failuer) => emit(
        state.copyWith(
          authStatus: AuthStatus.loginError,
          errorMessage: failuer.message,
        ),
      ),
      (success) => emit(state.copyWith(authStatus: AuthStatus.loginSuccess)),
    );
  }

  Future<void> forgot(String email) async {
    emit(state.copyWith(authStatus: AuthStatus.forgotLoading));
    (await authRepo.forgotPassword(email)).fold(
      (failuer) => emit(
        state.copyWith(
          authStatus: AuthStatus.forgotError,
          errorMessage: failuer.message,
        ),
      ),
      (data) => emit(
        state.copyWith(
          authStatus: AuthStatus.forgotSuccess,
          forgotPasswordResponse: data,
        ),
      ),
    );
  }

  Future<void> reset(String email, String code, String newPassword) async {
    emit(state.copyWith(authStatus: AuthStatus.resetLading));
    (await authRepo.resetPassword(email, code, newPassword)).fold(
      (failuer) => emit(
        state.copyWith(
          authStatus: AuthStatus.resetError,
          errorMessage: failuer.message,
        ),
      ),
      (success) => emit(state.copyWith(authStatus: AuthStatus.resetSuccess)),
    );
  }
}
