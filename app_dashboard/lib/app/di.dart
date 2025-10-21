import 'package:app_dashboard/featuers/categories/data/category_repo_imp.dart';
import 'package:app_dashboard/featuers/categories/data/data_source/categories_data_source.dart';
import 'package:app_dashboard/featuers/categories/data/data_source/categories_data_source_impl.dart';
import 'package:app_dashboard/featuers/categories/ui/logic/categories_repo.dart';
import 'package:app_dashboard/featuers/categories/ui/logic/controller/cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared/core/network/network_info.dart';

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
