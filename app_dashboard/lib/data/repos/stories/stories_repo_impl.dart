import 'package:app_dashboard/data/data_source/remote/stories/stories_data_source.dart';
import 'package:app_dashboard/data/repos/stories/stories_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:shared/core/errors/error_handler.dart';
import 'package:shared/core/errors/failuer.dart';
import 'package:shared/core/network/network_info.dart';

class StoriesRepoImpl implements StoriesRepo {
  final StoriesDataSource storiesDataSource;
  final NetworkInfo networkInfo;

  StoriesRepoImpl({required this.storiesDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, void>> createStory({
    required String title,
    required String image,
    required String desc,
    required String content,
    required int id,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        await storiesDataSource.createStoryByCategoryID(
          title: title,
          image: image,
          desc: desc,
          content: content,
          id: id,
        );
        return const Right(null);
      } else {
        return Left(NetworkFailure('No internet connection'));
      }
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      return Left(failure);
    }
  }
}
