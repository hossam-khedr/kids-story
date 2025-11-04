import 'package:dartz/dartz.dart';
import 'package:shared/core/errors/failuer.dart';
import 'package:shared/responses/library_response.dart';

abstract class LibraryRepo{
  Future<Either<Failure,void>>addStoryToLibrary(int storyID);
  Future<Either<Failure,List<LibraryResponse>>>getStoriesFromLibrary();
}