import 'package:get_it/get_it.dart';
import 'package:kids_story_ai/app/index.dart';




final getIt = GetIt.instance;

Future<void> initApp() async {
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
}

Future<void> initAuthModule() async {
  getIt.registerFactory<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());
  getIt.registerFactory<AuthRepo>(
    () => AuthRepoImpl(authRemoteDataSource: getIt(), networkInfo: getIt()),
  );
  getIt.registerFactory(() => AuthCubit(authRepo: getIt()));
}

Future<void> initLayout() async {
  getIt.registerFactory<LayoutCubit>(() => LayoutCubit());
}

Future<void> initHomeModule() async {
  getIt.registerFactory<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl());
  getIt.registerFactory<HomeRepo>(
    () => HomeRepoImpl(homeRemoteDataSource: getIt(), networkInfo: getIt()),
  );
  getIt.registerFactory(() => HomeCubit(homeRepo: getIt()));
}
