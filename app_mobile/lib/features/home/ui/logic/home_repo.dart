
import 'package:dartz/dartz.dart';
import 'package:shared/core/errors/failuer.dart';

import 'package:shared/responses/category_response.dart';
import 'package:shared/responses/story_response.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<CategoryResponse>>>getCategories();
  Future<Either<Failure,List<StoryResponse>>>getStoriesByCategoryID(int categoryID );
}