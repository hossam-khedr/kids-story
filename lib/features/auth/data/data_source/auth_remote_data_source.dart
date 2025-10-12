abstract class AuthRemoteDataSource{
  Future<dynamic>register(String name,String email,String password);
  Future<dynamic>login(String email,String password);
}