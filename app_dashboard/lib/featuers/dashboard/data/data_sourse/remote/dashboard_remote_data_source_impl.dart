import 'package:app_dashboard/core/requestes/category_request.dart';
import 'package:app_dashboard/core/requestes/story_request.dart';
import 'package:app_dashboard/featuers/dashboard/data/data_sourse/remote/dashboard_remote_data_source.dart';
import 'package:shared/core/constants/api_constants.dart';
import 'package:shared/core/network/dio_client.dart';
import 'package:shared/utils/helpers/cache_helper.dart';

class DashboardRemoteDataSourceImpl implements DashBoardRemoteDataSource {
  final adminToken = CacheHelper.getString(ApiConstants.adminAccessToken);

  @override
  Future<dynamic> getDashboardStats() async {
    final response = await DioHelper.getData(
      url: ApiConstants.adminStatsDashboardEndPoint,
      headers: {"Authorization": "Bearer $adminToken"},
    );
    return response;
  }

  @override
  Future<dynamic> createCategory({required CategoryRequest request}) async {
    final response = await DioHelper.uploadFileWebSupport(
      url: ApiConstants.adminCategoriesEndPoint,
      token: adminToken,
      data: {"name": request.name, "description": request.description},
      file: request.file,
      fieldName: 'image',
    );
    return response;
  }

  @override
  Future<dynamic> getCategoriesNames() async {
    final response = await DioHelper.getData(
      url: ApiConstants.categoriesNamesEndPoint,
      token: adminToken,
    );
    return response;
  }

  @override
  Future<dynamic> createStory(StoryRequest request) async {
    final response = await DioHelper.uploadFileWebSupport(
      url: ApiConstants.adminStoriesEndPoint,
      token: adminToken,
      data: {
        'title': request.title,
        'content': request.content,
        'categoryName': request.categoryName,
        'ageMin': request.ageMin,
        'ageMax': request.ageMax,
        'isActive': request.isActive,
      },
      file: request.file,
      fieldName: 'image',
    );
    return response;
  }


}
