import 'package:app_mobile/features/auth/data/responses/forgot_password_response.dart';
import 'package:dartz/dartz.dart';
import 'package:shared/core/constants/api_constants.dart';
import 'package:shared/core/errors/error_handler.dart';
import 'package:shared/core/errors/failuer.dart';
import 'package:shared/core/network/network_info.dart';
import 'package:shared/utils/helpers/cache_helper.dart';

import '../ui/logic/auth_repo.dart';
import 'data_source/auth_remote_data_source.dart';




class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepoImpl({required this.authRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, void>> register(
    String name,
    String email,
    String password,
  ) async {
    try{
      if (await networkInfo.isConnected) {
       await authRemoteDataSource.register(name, email, password);
        return const Right(null);
      }else{
        return Left(NetworkFailure('No internet connection'));
      }
    }catch(e){
      final failuer = ErrorHandler.handle(e);
      return Left(failuer);
    }
  }

  @override
  Future<Either<Failure, void>> login(String email, String password)async {
    try{
      if (await networkInfo.isConnected) {
     final response =   await authRemoteDataSource.login( email, password);
     final data = response.data as Map<String,dynamic>;
     final token = data['token'];
     CacheHelper.setData(ApiConstants.tokenKey, token);
        return const Right(null);
      }else{
        return Left(NetworkFailure('No internet connection'));
      }
    }catch(e){
      final failuer = ErrorHandler.handle(e);
      return Left(failuer);
    }
  }

  @override
  Future<Either<Failure, ForgotPasswordResponse>> forgotPassword(String email)async {
    try{
      if (await networkInfo.isConnected) {
      final response =   await authRemoteDataSource.forgotPassword(email);
      final data = response.data as Map<String,dynamic>;
      final result = ForgotPasswordResponse.fromJson(data);
        return  Right(result);
      }else{
        return Left(NetworkFailure('No internet connection'));
      }
    }catch(e){
      final failuer = ErrorHandler.handle(e);
      return Left(failuer);
    }
  }
  @override
  Future<Either<Failure, String>> verifyOTP(String email,String code)async {
    try{
      if (await networkInfo.isConnected) {
        final response =   await authRemoteDataSource.verifyOTP(email, code);
        final data = response.data['message'] as String;
        return  Right(data);
      }else{
        return Left(NetworkFailure('No internet connection'));
      }
    }catch(e){
      final failuer = ErrorHandler.handle(e);
      return Left(failuer);
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email,  String newPassword)async {
    try{
      if (await networkInfo.isConnected) {
        await authRemoteDataSource.resetPassword(email,newPassword);
        return const Right(null);
      }else{
        return Left(NetworkFailure('No internet connection'));
      }
    }catch(e){
      final failuer = ErrorHandler.handle(e);
      return Left(failuer);
    }
  }
}
