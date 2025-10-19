import 'package:kids_story_ai/app/index.dart';
import 'package:kids_story_ai/features/auth/data/responses/forgot_password_response.dart';

abstract class AuthRepo{
  Future<Either<Failure,void>>register(String name,String email,String password);
  Future<Either<Failure,void>>login(String email,String password);
  Future<Either<Failure,ForgotPasswordResponse>>forgotPassword(String email,);
  Future<Either<Failure, String>> verifyOTP(String email,String code);
  Future<Either<Failure,void>>resetPassword(String email,  String newPassword);
}