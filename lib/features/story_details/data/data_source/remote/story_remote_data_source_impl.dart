import 'package:kids_story_ai/app/index.dart';
import 'package:kids_story_ai/features/story_details/data/data_source/remote/story_remote_data_source.dart';

class StoryDetailsRemoteDataSourceImpl implements StoryDetailsRemoteDataSource {
  @override
  Future<dynamic> getStoryByID(int storyID) async {
    final response = await DioHelper.getData(
      url: '${ApiConstants.getStoryEndPoint}/$storyID',
    );
    return response;
  }
}
