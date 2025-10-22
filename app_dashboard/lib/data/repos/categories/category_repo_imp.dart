import 'package:dartz/dartz.dart';
import 'package:shared/core/errors/error_handler.dart';
import 'package:shared/core/errors/failuer.dart';
import 'package:shared/core/network/network_info.dart';
import 'package:shared/responses/category_response.dart';

import '../../data_source/remote/categories/categories_data_source.dart';
import 'categories_repo.dart';

class CategoriesRepoImpl implements CategoriesRepo {
  CategoriesDataSource categoriesDataSource;
  NetworkInfo networkInfo;

  CategoriesRepoImpl({
    required this.categoriesDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, void>> createCategory({
    required String title,
    required String image,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        await categoriesDataSource.createCategory(
          title: title,
          imageUrl: image,
        );
        return const Right(null);
      } else {
        return Left(NetworkFailure('No Internet Connection'));
      }
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, List<CategoryResponse>>> fitchCategories() async {
    try {
      if (await networkInfo.isConnected) {
        final response = await categoriesDataSource.fitchCategories();
        final data = response.data['categories'] as List;
        final categories = data
            .map((e) => CategoryResponse.fromJson(e))
            .toList();
        return Right(categories);
      } else {
        return Left(NetworkFailure('No Internet Connection'));
      }
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, void>> deleteCategory(int categoryId)async {
    try {
      if (await networkInfo.isConnected) {
        await categoriesDataSource.deleteCategory(categoryId);
        return const Right(null);
      } else {
        return Left(NetworkFailure('No Internet Connection'));
      }
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      return Left(failure);
    }
  }
}
