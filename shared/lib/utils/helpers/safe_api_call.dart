

import 'package:dartz/dartz.dart';
import 'package:shared/core/network/network_info.dart';

import '../../core/errors/error_handler.dart';
import '../../core/errors/failuer.dart';

class ApiCallHelper{
  final NetworkInfoImpl networkInfoImpl = NetworkInfoImpl();

  Future<Either<Failure, T>> safeApiCall<T>({
    T? input,
    required Future<T> Function() callback,
  }) async {
    try {
      if (await networkInfoImpl.isConnected) {
        final result = await callback();
        return Right(result);
      } else {
        return const Left(NetworkFailure('No internet connection'));
      }
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      return Left(failure);
    }
  }
}