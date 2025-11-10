abstract class RootRemoteDataSource{
  Future<dynamic>searchStoriesByTitle({required String search,required int page,required int limit});
}