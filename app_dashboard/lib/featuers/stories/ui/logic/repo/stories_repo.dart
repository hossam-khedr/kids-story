import 'package:dartz/dartz.dart';
import 'package:shared/core/errors/failuer.dart';
import 'package:shared/responses/story_response.dart';
abstract class StoriesRepo{
  Future<Either<Failure,StoriesResponse>>getAllStories();
}