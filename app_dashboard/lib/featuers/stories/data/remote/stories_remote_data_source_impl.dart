import 'package:app_dashboard/featuers/stories/data/remote/stories_remote_data_source.dart';
import 'package:shared/core/constants/api_constants.dart';
import 'package:shared/core/network/dio_client.dart';
import 'package:shared/utils/helpers/cache_helper.dart';

class StoriesRemoteDataSourceImpl implements StoriesRemoteDataSource{
  final adminToken = CacheHelper.getString(ApiConstants.adminAccessToken);
  @override
  Future<dynamic> getAllStories()async {
    final response = await DioHelper.getData(
      url: ApiConstants.adminStoriesEndPoint,
      token: adminToken,
    );
    return response;
  }

  @override
  Future<dynamic> deleteStory({required int id})async {
    final response = await DioHelper.deleteData(
      url: '${ApiConstants.adminStoriesEndPoint}$id',
      token: adminToken,
    );
    return response;
  }

}