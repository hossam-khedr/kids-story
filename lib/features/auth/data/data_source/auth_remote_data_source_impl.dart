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
  Future<dynamic> resetPassword(String email, String newPassword)async {
    final response = await DioHelper.postData(
      url: ApiConstants.resetPasswordEndPoint,
      data: {
        "email":email,
        "new_password":newPassword
      },
    );
    return response;
  }

  @override
  Future<dynamic> verifyOTP(String email, String code)async {
    final response = await DioHelper.postData(
      url: ApiConstants.verifyOtpEndPoint,
      data: {
        "email":email,
        "code":code,
      },
    );
    print("CODE : ${response.data}");
    return response;
  }
}
