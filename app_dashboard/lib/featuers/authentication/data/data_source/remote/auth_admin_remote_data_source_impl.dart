import 'package:app_dashboard/featuers/authentication/data/data_source/remote/auth_admin_remote_data_source.dart';
import 'package:shared/core/constants/api_constants.dart';
import 'package:shared/core/network/dio_client.dart';
import 'package:shared/utils/helpers/cache_helper.dart';

class AuthAdminRemoteDataSourceImpl implements AuthAdminRemoteDataSource {

  @override
  Future<dynamic> loginAdmin({
    required String email,
    required String password,
  }) async {
    final response = await DioHelper.postData(
      url: ApiConstants.loginAdminEndPoint,
      data: {"email": email, "password": password},
    );
    return response;
  }

  @override
  Future<dynamic> registerAdmin({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await DioHelper.postData(
      url: ApiConstants.registerAdminEndPoint,
      data: {"name": name, "email": email, "password": password},
    );
    return response;
  }
}
