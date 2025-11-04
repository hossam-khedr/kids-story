import 'package:app_mobile/features/my_library/data/data_source/library_data_source.dart';
import 'package:shared/core/constants/api_constants.dart';
import 'package:shared/core/network/dio_client.dart';
import 'package:shared/utils/helpers/cache_helper.dart';

class LibraryDataSourceImpl implements LibraryDataSource {
  final userToken = CacheHelper.getString(ApiConstants.tokenKey);
  @override
  Future<dynamic> addStoryToLibrary(int storyID) async {
    final response = await DioHelper.postData(
      url: ApiConstants.libraryEndPoint,
      data: {"story_id": storyID, "progress": 0.0},
        headers: {"Authorization":"Bearer $userToken"}
    );
    return response;
  }

  @override
  Future<dynamic> getStoriesFromLibrary()async {
    final response = await DioHelper.getData(
      url: ApiConstants.libraryEndPoint,
      headers: {"Authorization":"Bearer $userToken"}

    );
    return response;
  }
}
