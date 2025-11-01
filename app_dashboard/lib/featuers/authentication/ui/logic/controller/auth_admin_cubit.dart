import 'package:app_dashboard/featuers/authentication/ui/logic/auth_admin_repo.dart';
import 'package:app_dashboard/featuers/authentication/ui/logic/controller/auth_admin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthAdminCubit extends Cubit<AuthAdminState> {
  final AuthAdminRepo adminRepo;

  AuthAdminCubit({required this.adminRepo}) : super(AuthAdminState());

  Future<void> loginAdmin({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(status: AuthAdminStatus.loading));
    (await adminRepo.adminLogin(email: email, password: password)).fold(
      (failure) => emit(
        state.copyWith(
          status: AuthAdminStatus.error,
          errorMessage: failure.message,
        ),
      ),
      (success) => emit(state.copyWith(status: AuthAdminStatus.success)),
    );
  }

  Future<void> registerAdmin({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(status: AuthAdminStatus.registerLoading));
    (await adminRepo.adminRegister(name: name, email: email, password: password)).fold(
          (failure) => emit(
        state.copyWith(
          status: AuthAdminStatus.registerError,
          errorMessage: failure.message,
        ),
      ),
          (success) => emit(state.copyWith(status: AuthAdminStatus.registerSuccess)),
    );
  }
}
