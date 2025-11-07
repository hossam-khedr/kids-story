import 'package:app_dashboard/featuers/stories/data/remote/stories_remote_data_source.dart';
import 'package:app_dashboard/featuers/stories/ui/logic/repo/stories_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:shared/core/errors/failuer.dart';
import 'package:shared/responses/story_response.dart';
import 'package:shared/utils/helpers/safe_api_call.dart';

class StoriesRepoImpl implements StoriesRepo{
  final StoriesRemoteDataSource remoteDataSource;

  StoriesRepoImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, StoriesResponse>> getAllStories()async {
    return ApiCallHelper().safeApiCall(callback: ()async{
      final response = await remoteDataSource.getAllStories();
      final data = StoriesResponse.fromJson(response.data);
      return data;
    });
  }

}