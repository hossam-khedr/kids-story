
import 'package:app_mobile/features/story_details/data/data_source/remote/story_remote_data_source.dart';
import 'package:shared/core/constants/api_constants.dart';
import 'package:shared/core/network/dio_client.dart';

class StoryDetailsRemoteDataSourceImpl implements StoryDetailsRemoteDataSource {
  @override
  Future<dynamic> getStoryByID(int storyID) async {
    final response = await DioHelper.getData(
      url: '${ApiConstants.getStoryEndPoint}/$storyID',
    );
    return response;
  }
}
