

import 'package:dartz/dartz.dart';
import 'package:shared/core/errors/failuer.dart';

import '../../data/responses/forgot_password_response.dart';

abstract class AuthRepo{
  Future<Either<Failure,void>>register(String name,String email,String password);
  Future<Either<Failure,void>>login(String email,String password);
  Future<Either<Failure,ForgotPasswordResponse>>forgotPassword(String email,);
  Future<Either<Failure, String>> verifyOTP(String email,String code);
  Future<Either<Failure,void>>resetPassword(String email,  String newPassword);
}