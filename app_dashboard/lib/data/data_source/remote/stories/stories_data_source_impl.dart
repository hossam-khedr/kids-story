import 'package:app_dashboard/data/data_source/remote/stories/stories_data_source.dart';
import 'package:shared/core/constants/api_constants.dart';
import 'package:shared/core/network/dio_client.dart';

class StoriesDataSourceImpl implements StoriesDataSource {
  @override
  Future<dynamic> createStoryByCategoryID({
    required String title,
    required String image,
    required String desc,
    required String content,
    required int id,
  }) async {
    final response = await DioHelper.postData(
      url: ApiConstants.storiesEndPoint,
      data: {
        "title": title,
        "image": image,
        "descr": desc,
        "content": content,
        "category_id": id,
      },
    );
    return response;
  }

  @override
  Future<dynamic> getStoriesByCategory(int categoryID) async {
    final response = await DioHelper.getData(
      url: '${ApiConstants.storiesByCategoryEndPoint}$categoryID',
    );
    return response.data;
  }

  @override
  Future<dynamic> deleteStory(int storyID)async {
    final response = await DioHelper.deleteData(
      url: '${ApiConstants.storiesEndPoint}$storyID',
    );
    return response;
  }
}
