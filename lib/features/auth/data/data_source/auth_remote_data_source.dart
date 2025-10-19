import 'package:kids_story_ai/features/auth/data/responses/forgot_password_response.dart';

abstract class AuthRemoteDataSource{
  Future<dynamic>register(String name,String email,String password);
  Future<dynamic>login(String email,String password);
  Future<dynamic>forgotPassword(String email,);
  Future<dynamic>verifyOTP(String email,String code);
  Future<dynamic>resetPassword(String email,String newPassword);
}