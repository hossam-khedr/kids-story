import 'package:shared/core/constants/api_constants.dart';
import 'package:shared/core/network/dio_client.dart';

import 'categories_data_source.dart';

class CategoriesDataSourceImpl implements CategoriesDataSource {
  @override
  Future<dynamic> createCategory({
    required String title,
    required String imageUrl,
  }) async {
    final responsr = await DioHelper.postData(
      url: ApiConstants.categoryEndPoint,
      data: {
        "title":title,
        "image":imageUrl
      }
    );
    return responsr;
  }

  @override
  Future<dynamic> fitchCategories()async {
    final response = await DioHelper.getData(
        url: ApiConstants.categoryEndPoint,

    );
    return response;
  }

  @override
  Future<dynamic> deleteCategory(int categoryId)async {
    final response = await DioHelper.deleteData(
      url:'${ApiConstants.categoryEndPoint}$categoryId',
    );
    return response;
  }
}
