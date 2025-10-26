import 'package:dartz/dartz.dart';
import 'package:shared/core/errors/failuer.dart';
import 'package:shared/responses/story_response.dart';

abstract class StoriesRepo{
  Future<Either<Failure,void>>createStory({
    required String title,
    required String image,
    required String desc,
    required String content,
    required int id,
  });

  Future<Either<Failure,List<StoryResponse>>>getStoriesByCategory(int categoryId);
  Future<Either<Failure,void>>deleteStory(int storyId);
}