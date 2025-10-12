import 'package:kids_story_ai/app/index.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {

  @override
  Future<dynamic> register(String name, String email, String password) async {
    final response = await DioHelper.postData(
      url: ApiConstants.registerEndPoint,
      data: {
        "name":name,
        "email":email,
        "password":password
      },
    );
    return response;
  }

  @override
  Future<dynamic> login(String email, String password)async {
    final response =await DioHelper.postData(
      url: ApiConstants.loginEndPoint,
      data: {
        "email":email,
        "password":password
      },
    );
    return response;
  }
}
