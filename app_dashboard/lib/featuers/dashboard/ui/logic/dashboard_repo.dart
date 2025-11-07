import 'package:app_dashboard/core/requestes/category_request.dart';
import 'package:app_dashboard/core/requestes/story_request.dart';
import 'package:app_dashboard/core/responses/categories_names_response.dart';
import 'package:app_dashboard/core/responses/dashboard_stats_response.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared/core/errors/failuer.dart';

abstract class DashboardRepo {
  Future<Either<Failure, StatisticsResponse>> getDashboardStats();

  Future<Either<Failure, void>> createCategory({
    required CategoryRequest request,
  });

  Future<Either<Failure, List<CategoriesNamesResponse>>> getCategoriesNames();

  Future<Either<Failure, void>> createStory({required StoryRequest request});
}
