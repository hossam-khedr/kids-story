import 'package:dartz/dartz.dart';
import 'package:shared/core/errors/failuer.dart';

abstract class AuthAdminRepo {
  Future<Either<Failure, void>> adminLogin({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> adminRegister({
    required String name,
    required String email,
    required String password,
  });
}
