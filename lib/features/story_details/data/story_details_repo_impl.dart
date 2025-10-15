import 'package:dartz/dartz.dart';
import 'package:kids_story_ai/app/index.dart';
import 'package:kids_story_ai/core/errors/failuer.dart';
import 'package:kids_story_ai/features/story_details/data/data_source/remote/story_remote_data_source.dart';
import 'package:kids_story_ai/features/story_details/data/responses/story_details_response.dart';
import 'package:kids_story_ai/features/story_details/ui/logic/story_details_repo.dart';

class StoryDetailsRepoImpl implements StoryDetailsRepo {
  final StoryDetailsRemoteDataSource storyRemoteDataSource;
  final NetworkInfo networkInfo;

  StoryDetailsRepoImpl({
    required this.storyRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, StoryDetailsResponse>> getStoryByID(
    int storyID,
  ) async {
   try{
     if(await networkInfo.isConnected){
       final response = await storyRemoteDataSource.getStoryByID(storyID);
       final data = response.data as Map<String,dynamic>;
       StoryDetailsResponse result = StoryDetailsResponse.fromJson(data);
       return Right(result);
     }else{
       return Left(NetworkFailure('No Internet Connection'));
     }
   }catch(error){
     final failure = ErrorHandler.handle(error);
     return Left(failure);
   }
  }
}
