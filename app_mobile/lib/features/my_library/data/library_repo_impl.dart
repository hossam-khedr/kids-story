import 'package:app_mobile/features/my_library/data/data_source/library_data_source.dart';
import 'package:app_mobile/features/my_library/ui/logic/library_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:shared/core/errors/error_handler.dart';

import 'package:shared/core/errors/failuer.dart';
import 'package:shared/core/network/network_info.dart';
import 'package:shared/responses/library_response.dart';

class LibraryRepoImpl implements LibraryRepo {
  final NetworkInfo networkInfo;
  final LibraryDataSource libraryDataSource;

  LibraryRepoImpl({required this.networkInfo, required this.libraryDataSource});

  @override
  Future<Either<Failure, void>> addStoryToLibrary(int storyID) async {
    try {
      if (await networkInfo.isConnected) {
        await libraryDataSource.addStoryToLibrary(storyID);

        return Right(null);
      } else {
        return Left(NetworkFailure('No Internet Connection'));
      }
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, List<LibraryResponse>>> getStoriesFromLibrary() async {
    try {
      if (await networkInfo.isConnected) {
        final response = await libraryDataSource.getStoriesFromLibrary();
        final data = response.data['library'] as List;
        final result = data.map((e) =>
            LibraryResponse.fromJson(e)).toList();

        return Right(result);
      } else {
        return Left(NetworkFailure('No Internet Connection'));
      }
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      return Left(failure);
    }
  }
}
