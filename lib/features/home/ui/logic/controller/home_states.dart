import 'package:kids_story_ai/app/index.dart';
import 'package:kids_story_ai/features/home/data/responses/story_response.dart';
enum HomeStatus {
  init,
  changeCategoryTap,
  getCategoriesLoading,
  getCategoriesError,
  getCategoriesSuccess,
  getStoriesLoading,
  getStoriesError,
  getStoriesSuccess,
}

class HomeStates {
  final HomeStatus homeStatus;
final String errorMessage;
  final int categoryIndex;
 final List<CategoryResponse> categories;
 final List<StoryResponse> stories;

  HomeStates({
    this.homeStatus = HomeStatus.init,
    this.errorMessage = '',
    this.categoryIndex = 0,
    this.categories = const [],
    this.stories = const [],
  });

  bool get isGetCategoriseLoading => homeStatus==HomeStatus.getCategoriesLoading;
  bool get isGetCategoriseError => homeStatus==HomeStatus.getCategoriesError;
  bool get isGetCategoriseSuccess => homeStatus==HomeStatus.getCategoriesSuccess;
  bool get isGetStoriesLoading => homeStatus==HomeStatus.getStoriesLoading;
  bool get isGetStoriesError => homeStatus==HomeStatus.getStoriesError;
  bool get isGetStoriesSuccess => homeStatus==HomeStatus.getStoriesSuccess;
  bool get ischangeCategoryTap => homeStatus==HomeStatus.changeCategoryTap;

  HomeStates copyWith({
    final HomeStatus? homeStatus,
    final String? errorMessage,
    final int? categoryIndex,
    List<CategoryResponse>? categories,
    List<StoryResponse>? stories,
  }) {
    return HomeStates(
      homeStatus: homeStatus ?? this.homeStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      categoryIndex: categoryIndex ?? this.categoryIndex,
      categories: categories ?? this.categories,
      stories: stories ?? this.stories,
    );
  }
}
