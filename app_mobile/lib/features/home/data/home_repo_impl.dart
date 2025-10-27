
import 'package:shared/responses/category_response.dart';
import 'package:shared/responses/story_response.dart';
import 'package:dartz/dartz.dart';
import 'package:shared/core/errors/error_handler.dart';
import 'package:shared/core/errors/failuer.dart';
import 'package:shared/core/network/network_info.dart';

import '../ui/logic/home_repo.dart';
import 'data_source/home_remote_data_source.dart';

class HomeRepoImpl implements HomeRepo {
  final NetworkInfo networkInfo;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({required this.networkInfo, required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<CategoryResponse>>> getCategories() async {
    try {
      if (await networkInfo.isConnected) {
        final response = await homeRemoteDataSource.getCategories();
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
  Future<Either<Failure, List<StoryResponse>>> getStoriesByCategoryID(
    int categoryID,
  ) async {
    try {
      if (await networkInfo.isConnected) {
        final response = await homeRemoteDataSource.getStoriesByCategoryID(
          categoryID,
        );
        final data = response['data']['stories'] as List;
        final stories = data.map((e) => StoryResponse.fromJson(e)).toList();
        return Right(stories);
      } else {
        return Left(NetworkFailure('No Internet Connection'));
      }
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      return Left(failure);
    }
  }
}
