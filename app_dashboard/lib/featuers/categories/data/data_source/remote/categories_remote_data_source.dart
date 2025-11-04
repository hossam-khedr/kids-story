abstract class CategoriesRemoteDataSource{
  Future<dynamic>getCategories();
  Future<dynamic>deleteCategory({required int id});
}