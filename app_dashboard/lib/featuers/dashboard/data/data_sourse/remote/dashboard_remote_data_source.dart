import 'package:app_dashboard/core/requestes/category_request.dart';
import 'package:app_dashboard/core/requestes/story_request.dart';
import 'package:image_picker/image_picker.dart';

abstract class DashBoardRemoteDataSource {
  Future<dynamic> getDashboardStats();

  Future<dynamic> createCategory({required CategoryRequest request});

  Future<dynamic> getCategoriesNames();

  Future<dynamic> createStory(StoryRequest request);


}
