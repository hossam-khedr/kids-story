import 'package:app_dashboard/data/data_source/remote/stories/stories_data_source.dart';
import 'package:app_dashboard/data/data_source/remote/stories/stories_data_source_impl.dart';
import 'package:app_dashboard/data/repos/categories/category_repo_imp.dart';
import 'package:app_dashboard/data/repos/categories/categories_repo.dart';
import 'package:app_dashboard/data/repos/stories/stories_repo.dart';
import 'package:app_dashboard/data/repos/stories/stories_repo_impl.dart';
import 'package:app_dashboard/featuers/authentication/data/auth_admin_repo_impl.dart';
import 'package:app_dashboard/featuers/authentication/data/data_source/local/auth_admin_local_data_source.dart';
import 'package:app_dashboard/featuers/authentication/data/data_source/local/auth_admin_local_data_source_impl.dart';
import 'package:app_dashboard/featuers/authentication/data/data_source/remote/auth_admin_remote_data_source_impl.dart';
import 'package:app_dashboard/featuers/authentication/ui/logic/auth_admin_repo.dart';
import 'package:app_dashboard/featuers/authentication/ui/logic/controller/auth_admin_cubit.dart';
import 'package:app_dashboard/featuers/categories/ui/logic/controller/cubit.dart';
import 'package:app_dashboard/featuers/dashboard/data/data_sourse/remote/dashboard_remote_data_source.dart';
import 'package:app_dashboard/featuers/dashboard/data/data_sourse/remote/dashboard_remote_data_source_impl.dart';
import 'package:app_dashboard/featuers/dashboard/data/repos/dashboard_repo_impl.dart';
import 'package:app_dashboard/featuers/dashboard/ui/logic/controller/cubit.dart';
import 'package:app_dashboard/featuers/dashboard/ui/logic/dashboard_repo.dart';
import 'package:app_dashboard/featuers/stories/ui/logic/cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared/core/network/network_info.dart';

import '../data/data_source/remote/categories/categories_data_source.dart';
import '../data/data_source/remote/categories/categories_data_source_impl.dart';
import '../featuers/authentication/data/data_source/remote/auth_admin_remote_data_source.dart';

final getIt = GetIt.instance;

Future<void> setUpCategories() async {
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  getIt.registerFactory<CategoriesDataSource>(() => CategoriesDataSourceImpl());
  getIt.registerFactory<CategoriesRepo>(
    () =>
        CategoriesRepoImpl(categoriesDataSource: getIt(), networkInfo: getIt()),
  );
  getIt.registerFactory(() => CategoriesCubit(categoriesRepo: getIt()));
}

Future<void> setUpStories() async {
  getIt.registerFactory<StoriesDataSource>(() => StoriesDataSourceImpl());
  getIt.registerFactory<StoriesRepo>(
    () => StoriesRepoImpl(storiesDataSource: getIt(), networkInfo: getIt()),
  );
  getIt.registerFactory(() => StoriesCubit(storiesRepo: getIt()));
}

Future<void> setupAuthAdmin() async {
  getIt.registerFactory<AuthAdminLocalDataSource>(
    () => AuthAdminLocalDataSourceImpl(),
  );
  getIt.registerFactory<AuthAdminRemoteDataSource>(
    () => AuthAdminRemoteDataSourceImpl(),
  );
  getIt.registerFactory<AuthAdminRepo>(
    () => AuthAdminRepoImpl(
      adminLocalDataSource: getIt(),
      adminRemoteDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  getIt.registerFactory(() => AuthAdminCubit(adminRepo: getIt()));
}

Future<void> setupDashboard() async {
  getIt.registerFactory<DashBoardRemoteDataSource>(
    () => DashboardRemoteDataSourceImpl(),
  );
  getIt.registerFactory<DashboardRepo>(
    () => DashboardRepoImpl(remoteDataSource: getIt(), networkInfo: getIt()),
  );

  getIt.registerFactory(() => DashboardCubit(dashboardRepo: getIt()));
}
