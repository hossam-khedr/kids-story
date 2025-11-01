abstract class AuthAdminLocalDataSource{
  Future<void> saveAdminAccessToken({required String key,required String value});
  Future<void> saveAdminRefreshToken({required String key,required String value});
}