import 'package:kids_story_ai/app/index.dart';
import 'package:kids_story_ai/features/home/data/responses/story_response.dart';

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
        final data = response.data['stories'] as List;
        final categories = data.map((e) => StoryResponse.fromJson(e)).toList();
        return Right(categories);
      } else {
        return Left(NetworkFailure('No Internet Connection'));
      }
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      return Left(failure);
    }
  }
}
