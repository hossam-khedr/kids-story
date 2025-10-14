import 'package:kids_story_ai/app/index.dart';

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
      url: "${ApiConstants.storiesEndPoint}/$categoryID",
    );

    return response;
  }
}
