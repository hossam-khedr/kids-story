abstract class LibraryDataSource{
  Future<dynamic>addStoryToLibrary(int storyID);
  Future<dynamic>getStoriesFromLibrary();
}