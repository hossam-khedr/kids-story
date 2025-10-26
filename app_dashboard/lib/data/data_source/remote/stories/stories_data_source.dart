abstract class StoriesDataSource {
  Future<dynamic> createStoryByCategoryID({
    required String title,
    required String image,
    required String desc,
    required String content,
    required int id,
  });


  Future<dynamic>getStoriesByCategory(int categoryID);
  Future<dynamic>deleteStory(int storyID);
}
