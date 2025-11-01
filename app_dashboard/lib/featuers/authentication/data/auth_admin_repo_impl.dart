import 'package:app_dashboard/featuers/authentication/data/data_source/remote/auth_admin_remote_data_source.dart';
import 'package:app_dashboard/featuers/authentication/ui/logic/auth_admin_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:shared/core/constants/api_constants.dart';
import 'package:shared/core/errors/error_handler.dart';
import 'package:shared/core/errors/failuer.dart';
import 'package:shared/core/network/network_info.dart';

import 'data_source/local/auth_admin_local_data_source.dart';

class AuthAdminRepoImpl implements AuthAdminRepo {
  final NetworkInfo networkInfo;
  final AuthAdminRemoteDataSource adminRemoteDataSource;
  final AuthAdminLocalDataSource adminLocalDataSource;

  AuthAdminRepoImpl({
    required this.adminLocalDataSource,
    required this.adminRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, void>> adminLogin({
    required String email,
    required String password,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        final response = await adminRemoteDataSource.loginAdmin(
          email: email,
          password: password,
        );
        final accessToken = response.data['accessToken'];
        adminLocalDataSource.saveAdminAccessToken(
          key: ApiConstants.tokenKey,
          value: accessToken,
        );
        return const Right(null);
      } else {
        return const Left(NetworkFailure('No Internet Connection'));
      }
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, void>> adminRegister({
    required String name,
    required String email,
    required String password,
  })async {
    try {
      if (await networkInfo.isConnected) {
         await adminRemoteDataSource.registerAdmin(
           name: name,
          email: email,
          password: password,
        );
        return const Right(null);
      } else {
        return const Left(NetworkFailure('No Internet Connection'));
      }
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      return Left(failure);
    }
  }
}
