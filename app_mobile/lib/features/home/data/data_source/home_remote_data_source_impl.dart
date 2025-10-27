
import 'package:shared/core/constants/api_constants.dart';
import 'package:shared/core/network/dio_client.dart';

import 'home_remote_data_source.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<dynamic> getCategories() async {
    final response = await DioHelper.getData(
      url: ApiConstants.categoryEndPoint,
    );

    return response;
  }

  @override
  Future<dynamic> getStoriesByCategoryID(int categoryID)async {
    final response = await DioHelper.getData(
      url: "${ApiConstants.storiesByCategoryEndPoint}$categoryID",
    );

    return response.data;
  }
}
