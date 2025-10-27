
abstract class AuthRemoteDataSource{
  Future<dynamic>register(String name,String email,String password);
  Future<dynamic>login(String email,String password);
  Future<dynamic>forgotPassword(String email,);
  Future<dynamic>verifyOTP(String email,String code);
  Future<dynamic>resetPassword(String email,String newPassword);
}