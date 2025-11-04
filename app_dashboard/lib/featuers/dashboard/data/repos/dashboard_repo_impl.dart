import 'package:app_dashboard/featuers/dashboard/data/data_sourse/remote/dashboard_remote_data_source.dart';
import 'package:app_dashboard/featuers/dashboard/data/responses/dashboard_stats_response.dart';
import 'package:app_dashboard/featuers/dashboard/ui/logic/dashboard_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared/core/errors/error_handler.dart';
import 'package:shared/core/errors/failuer.dart';
import 'package:shared/core/network/network_info.dart';

class DashboardRepoImpl implements DashboardRepo {
  final NetworkInfo networkInfo;
  final DashBoardRemoteDataSource remoteDataSource;

  DashboardRepoImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, StatisticsResponse>> getDashboardStats() async {
    try {
      if (await networkInfo.isConnected) {
        final response = await remoteDataSource.getDashboardStats();
        final data = StatisticsResponse.fromJson(response.data);
        return Right(data);
      } else {
        return const Left(NetworkFailure("No Internet Connection"));
      }
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, void>> createCategory({
    required String name,
    required String description,
    required XFile file,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        await remoteDataSource.createCategory(
          name: name,
          description: description,
          file: file,
        );
        return const Right(null);
      } else {
        return const Left(NetworkFailure("No Internet Connection"));
      }
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      return Left(failure);
    }
  }
}
