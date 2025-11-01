import 'package:app_dashboard/featuers/authentication/data/data_source/local/auth_admin_local_data_source.dart';
import 'package:shared/utils/helpers/cache_helper.dart';

class AuthAdminLocalDataSourceImpl implements AuthAdminLocalDataSource{
  @override
  Future<void> saveAdminAccessToken({required String key, required String value})async {
    await CacheHelper.setData(key, value);
  }

  @override
  Future<void> saveAdminRefreshToken({required String key, required String value})async {
    await CacheHelper.setData(key, value);
  }


}