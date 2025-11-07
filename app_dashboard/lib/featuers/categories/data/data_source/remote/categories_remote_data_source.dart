import 'package:app_dashboard/core/requestes/category_request.dart';

abstract class CategoriesRemoteDataSource{
  Future<dynamic>getCategories();
  Future<dynamic>deleteCategory({required int id});
}