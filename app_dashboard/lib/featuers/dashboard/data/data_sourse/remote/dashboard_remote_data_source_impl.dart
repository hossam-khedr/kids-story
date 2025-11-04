import 'package:app_dashboard/featuers/dashboard/data/data_sourse/remote/dashboard_remote_data_source.dart';
import 'package:image_picker/image_picker.dart';
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
  Future<dynamic> createCategory({
    required String name,
    required String description,
    required XFile file,
  }) async {
    final response = await DioHelper.uploadFileWebSupport(
      url: ApiConstants.adminCategoriesEndPoint,
      token: adminToken,
      data: {"name": name, "description": description},
      file: file,
      fieldName: 'image',
    );
    return response;
  }

}
