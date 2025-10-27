

import 'package:dartz/dartz.dart';
import 'package:shared/core/errors/failuer.dart';

import '../../data/responses/story_details_response.dart';

abstract class StoryDetailsRepo{
  Future<Either<Failure,StoryDetailsResponse>>getStoryByID(int storyID);
}