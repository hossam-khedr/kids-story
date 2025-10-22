
abstract class CategoriesDataSource{
  Future<dynamic>createCategory({required String title,required String imageUrl});
  Future<dynamic>fitchCategories();
  Future<dynamic>deleteCategory(int categoryId);
}