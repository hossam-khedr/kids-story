import 'package:get_it/get_it.dart';
import 'package:kids_story_ai/app/index.dart';
import 'package:kids_story_ai/features/story_details/data/data_source/remote/story_remote_data_source.dart';
import 'package:kids_story_ai/features/story_details/ui/logic/controller/cubit.dart';
import 'package:kids_story_ai/features/story_details/ui/logic/story_details_repo.dart';

import '../features/story_details/data/data_source/remote/story_remote_data_source_impl.dart';
import '../features/story_details/data/story_details_repo_impl.dart';

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
