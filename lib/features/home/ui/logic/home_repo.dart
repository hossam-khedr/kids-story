import 'package:kids_story_ai/app/index.dart';
import 'package:kids_story_ai/features/home/data/responses/story_response.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<CategoryResponse>>>getCategories();
  Future<Either<Failure,List<StoryResponse>>>getStoriesByCategoryID(int categoryID );
}