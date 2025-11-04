import 'package:app_mobile/features/my_library/data/data_source/library_data_source.dart';
import 'package:app_mobile/features/my_library/data/data_source/library_data_source_imp.dart';
import 'package:app_mobile/features/my_library/data/library_repo_impl.dart';
import 'package:app_mobile/features/my_library/ui/logic/controller/cubit.dart';
import 'package:app_mobile/features/my_library/ui/logic/library_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:shared/core/network/network_info.dart';

import '../features/auth/data/auth_repo_impl.dart';
import '../features/auth/data/data_source/auth_remote_data_source.dart';
import '../features/auth/data/data_source/auth_remote_data_source_impl.dart';
import '../features/auth/ui/logic/auth_repo.dart';
import '../features/auth/ui/logic/controller/cubit.dart';
import '../features/home/data/data_source/home_remote_data_source.dart';
import '../features/home/data/data_source/home_remote_data_source_impl.dart';
import '../features/home/data/home_repo_impl.dart';
import '../features/home/ui/logic/controller/home_cubit.dart';
import '../features/home/ui/logic/home_repo.dart';
import '../features/story_details/data/data_source/remote/story_remote_data_source.dart';
import '../features/story_details/data/data_source/remote/story_remote_data_source_impl.dart';
import '../features/story_details/data/story_details_repo_impl.dart';
import '../features/story_details/ui/logic/controller/cubit.dart';
import '../features/story_details/ui/logic/story_details_repo.dart';
import '../layout_manager/logic/layout_cubit.dart';

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

Future<void> initStoryDetailsModule() async {
  getIt.registerFactory<StoryDetailsRemoteDataSource>(
    () => StoryDetailsRemoteDataSourceImpl(),
  );
  getIt.registerFactory<StoryDetailsRepo>(
    () => StoryDetailsRepoImpl(
      storyRemoteDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );
  getIt.registerFactory(() => StoryDetailsCubit(storyDetailsRepo: getIt()));
}

Future<void> initLibraryModule() async {
  getIt.registerFactory<LibraryDataSource>(
        () => LibraryDataSourceImpl(),
  );
  getIt.registerFactory<LibraryRepo>(
        () => LibraryRepoImpl(
      libraryDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );
  getIt.registerFactory(() => LibraryCubit(libraryRepo: getIt()));
}
