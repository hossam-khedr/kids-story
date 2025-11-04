import 'package:app_dashboard/featuers/categories/data/data_source/remote/categories_remote_data_source.dart';
import 'package:shared/core/constants/api_constants.dart';
import 'package:shared/core/network/dio_client.dart';
import 'package:shared/utils/helpers/cache_helper.dart';

class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final adminToken = CacheHelper.getString(ApiConstants.adminAccessToken);
  @override
  Future<dynamic> getCategories() async {
    final response = await DioHelper.getData(
      url: ApiConstants.adminCategoriesEndPoint,
      token: adminToken
    );
    return response;
  }

  @override
  Future<dynamic> deleteCategory({required int id})async {
    final response = await DioHelper.deleteData(
        url: '${ApiConstants.adminCategoriesEndPoint}$id',
        token: adminToken
    );
    return response;
  }
}
