import 'package:app_dashboard/featuers/authentication/data/auth_admin_repo_impl.dart';
import 'package:app_dashboard/featuers/authentication/data/data_source/local/auth_admin_local_data_source.dart';
import 'package:app_dashboard/featuers/authentication/data/data_source/local/auth_admin_local_data_source_impl.dart';
import 'package:app_dashboard/featuers/authentication/data/data_source/remote/auth_admin_remote_data_source_impl.dart';
import 'package:app_dashboard/featuers/authentication/ui/logic/auth_admin_repo.dart';
import 'package:app_dashboard/featuers/authentication/ui/logic/controller/auth_admin_cubit.dart';
import 'package:app_dashboard/featuers/categories/data/data_source/remote/categories_remote_data_source.dart';
import 'package:app_dashboard/featuers/categories/data/data_source/remote/categories_remote_data_source_impl.dart';
import 'package:app_dashboard/featuers/categories/data/repo_impl/categories_repo_impl.dart';
import 'package:app_dashboard/featuers/categories/ui/logic/controller/cubit.dart';
import 'package:app_dashboard/featuers/categories/ui/logic/repo/categories_repo.dart';
import 'package:app_dashboard/featuers/dashboard/data/data_sourse/remote/dashboard_remote_data_source.dart';
import 'package:app_dashboard/featuers/dashboard/data/data_sourse/remote/dashboard_remote_data_source_impl.dart';
import 'package:app_dashboard/featuers/dashboard/data/repos/dashboard_repo_impl.dart';
import 'package:app_dashboard/featuers/dashboard/ui/logic/controller/cubit.dart';
import 'package:app_dashboard/featuers/dashboard/ui/logic/dashboard_repo.dart';
import 'package:app_dashboard/featuers/root/data/remote/root_remote_data_source.dart';
import 'package:app_dashboard/featuers/root/data/remote/root_remote_data_source_impl.dart';
import 'package:app_dashboard/featuers/root/data/root_repo_impl/root_repo_impl.dart';
import 'package:app_dashboard/featuers/root/ui/logic/controller/cubit.dart';
import 'package:app_dashboard/featuers/root/ui/logic/repo/root_repo.dart';
import 'package:app_dashboard/featuers/stories/data/remote/stories_remote_data_source_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:shared/core/network/network_info.dart';

import '../featuers/authentication/data/data_source/remote/auth_admin_remote_data_source.dart';
import '../featuers/stories/data/remote/stories_remote_data_source.dart';
import '../featuers/stories/data/repo_impl/stories_repo_impl.dart';
import '../featuers/stories/ui/logic/controller/cubit.dart';
import '../featuers/stories/ui/logic/repo/stories_repo.dart';

final getIt = GetIt.instance;

Future<void> setupAuthAdmin() async {
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
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

Future<void> setupCategories() async {
  getIt.registerFactory<CategoriesRemoteDataSource>(
    () => CategoriesRemoteDataSourceImpl(),
  );
  getIt.registerFactory<CategoriesRepo>(
    () => CategoriesRepoImpl(dataSource: getIt(), networkInfo: getIt()),
  );

  getIt.registerFactory(() => CategoriesCubit(repo: getIt()));
}

Future<void> setupStories() async {
  getIt.registerFactory<StoriesRemoteDataSource>(
    () => StoriesRemoteDataSourceImpl(),
  );
  getIt.registerFactory<StoriesRepo>(
    () => StoriesRepoImpl(remoteDataSource: getIt()),
  );

  getIt.registerFactory(() => StoriesCubit(repo: getIt()));
}

Future<void> setupRoot() async {
  getIt.registerFactory<RootRemoteDataSource>(
        () => RootRemoteDataSourceImpl(),
  );
  getIt.registerFactory<RootRepo>(
        () => RootRepoImpl(dataSource: getIt()),
  );

  getIt.registerFactory(() => RootCubit(rootRepo:  getIt()));
}
