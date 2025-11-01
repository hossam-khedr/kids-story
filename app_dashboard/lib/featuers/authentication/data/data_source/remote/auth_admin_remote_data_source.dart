abstract class AuthAdminRemoteDataSource {
  Future<dynamic> loginAdmin({required String email, required String password});

  Future<dynamic> registerAdmin({
    required String name,
    required String email,
    required String password,
  });
}
