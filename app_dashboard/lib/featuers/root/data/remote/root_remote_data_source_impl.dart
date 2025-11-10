import 'package:app_dashboard/featuers/root/data/remote/root_remote_data_source.dart';
import 'package:shared/core/constants/api_constants.dart';
import 'package:shared/core/network/dio_client.dart';
import 'package:shared/utils/helpers/cache_helper.dart';

class RootRemoteDataSourceImpl implements RootRemoteDataSource{
  final adminToken = CacheHelper.getString(ApiConstants.adminAccessToken);
  @override
  Future<dynamic> searchStoriesByTitle({
    required String search,
    required int page,
    required int limit,
  }) async {
    final response = await DioHelper.getData(
        url: ApiConstants.adminStoriesEndPoint,
        query: {
          'search':search,
          'page':page,
          'limit':limit
        },
        token: adminToken
    );
    return response;
  }

}