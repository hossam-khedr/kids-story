abstract class HomeRemoteDataSource{
  Future<dynamic>getCategories();
  Future<dynamic>getStoriesByCategoryID(int categoryID);
}