import 'package:app_dashboard/featuers/add_new_category/data/data_source/categories_data_source.dart';
import 'package:shared/core/constants/api_constants.dart';
import 'package:shared/core/network/dio_client.dart';

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
}
