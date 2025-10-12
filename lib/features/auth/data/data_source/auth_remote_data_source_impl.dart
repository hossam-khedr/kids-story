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

  @override
  Future<dynamic> forgotPassword(String email)async {
    final  response =await DioHelper.postData(
      url: ApiConstants.forgotPasswordEndPoint,
      data: {
        "email":email,

      },
    );
    return response;
  }

  @override
  Future<dynamic> resetPassword(String email, String code, String newPassword)async {
    final response = await DioHelper.postData(
      url: ApiConstants.resetPasswordEndPoint,
      data: {
        "email":email,
        "reset_token":code,
        "new_password":newPassword
      },
    );
    return response;
  }
}
