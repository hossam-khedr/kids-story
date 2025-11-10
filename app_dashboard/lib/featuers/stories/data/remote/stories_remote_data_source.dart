abstract class StoriesRemoteDataSource{
  Future<dynamic>getAllStories();

  Future<dynamic>deleteStory({required int id});
}