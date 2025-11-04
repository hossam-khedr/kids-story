import 'package:app_dashboard/featuers/categories/data/data_source/remote/categories_remote_data_source.dart';
import 'package:app_dashboard/featuers/categories/ui/logic/repo/categories_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:shared/core/errors/error_handler.dart';
import 'package:shared/core/errors/failuer.dart';
import 'package:shared/core/network/network_info.dart';
import 'package:shared/responses/category_response.dart';

class CategoriesRepoImpl implements CategoriesRepo {
  final CategoriesRemoteDataSource dataSource;
  final NetworkInfo networkInfo;

  CategoriesRepoImpl({required this.dataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<CategoryResponse>>> getCategories() async {
    try {
      if (await networkInfo.isConnected) {
        final response = await dataSource.getCategories();
        final listData = response.data['categories'] as List;
        final result = listData
            .map((e) => CategoryResponse.fromJson(e))
            .toList();
        return Right(result);
      } else {
        return const Left(NetworkFailure('No internet connection'));
      }
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, void>> deleteCategory({required int id})async {
    try {
      if (await networkInfo.isConnected) {
        await dataSource.deleteCategory(id: id);
        return const Right(null);
      } else {
        return const Left(NetworkFailure('No internet connection'));
      }
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      return Left(failure);
    }
  }
}
