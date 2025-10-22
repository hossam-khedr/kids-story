import 'package:app_dashboard/data/data_source/remote/stories/stories_data_source.dart';
import 'package:app_dashboard/data/data_source/remote/stories/stories_data_source_impl.dart';
import 'package:app_dashboard/data/repos/categories/category_repo_imp.dart';
import 'package:app_dashboard/data/repos/categories/categories_repo.dart';
import 'package:app_dashboard/data/repos/stories/stories_repo.dart';
import 'package:app_dashboard/data/repos/stories/stories_repo_impl.dart';
import 'package:app_dashboard/featuers/categories/ui/logic/controller/cubit.dart';
import 'package:app_dashboard/featuers/stories/ui/logic/cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared/core/network/network_info.dart';

import '../data/data_source/remote/categories/categories_data_source.dart';
import '../data/data_source/remote/categories/categories_data_source_impl.dart';

final getIt = GetIt.instance;

Future<void> setUpCategories() async {
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  getIt.registerFactory<CategoriesDataSource>(() => CategoriesDataSourceImpl());
  getIt.registerFactory<CategoriesRepo>(
    () =>
        CategoriesRepoImpl(categoriesDataSource: getIt(), networkInfo: getIt()),

  );
  getIt.registerFactory(()=>CategoriesCubit(categoriesRepo: getIt()));
}

Future<void> setUpStories() async {
  getIt.registerFactory<StoriesDataSource>(() => StoriesDataSourceImpl());
  getIt.registerFactory<StoriesRepo>(
        () =>
        StoriesRepoImpl(storiesDataSource: getIt(), networkInfo: getIt()),

  );
  getIt.registerFactory(()=>StoriesCubit(storiesRepo: getIt()));
}
