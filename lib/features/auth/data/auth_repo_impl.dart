import 'package:kids_story_ai/app/index.dart';


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
       await authRemoteDataSource.login( email, password);
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
