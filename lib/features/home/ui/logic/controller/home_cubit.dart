import 'package:kids_story_ai/app/index.dart';

class HomeCubit extends Cubit<HomeStates> {
  final HomeRepo homeRepo;

  HomeCubit({required this.homeRepo}) : super(HomeStates());

  void changeCategoryTap(int index) {
    emit(
      state.copyWith(
        homeStatus: HomeStatus.changeCategoryTap,
        categoryIndex: index,
      ),
    );
  }

  Future<void> getCategories() async {
    emit(state.copyWith(homeStatus: HomeStatus.getCategoriesLoading));

    (await homeRepo.getCategories()).fold(
      (failure) => emit(
        state.copyWith(
          homeStatus: HomeStatus.getCategoriesError,
          errorMessage: failure.message,
        ),
      ),

      (data) => emit(
        state.copyWith(
          homeStatus: HomeStatus.getCategoriesSuccess,
          categories: data,
        ),
      ),
    );
  }

  Future<void> getStoriesByCategoryID(int categoryID) async {
    emit(state.copyWith(homeStatus: HomeStatus.getStoriesLoading));

    (await homeRepo.getStoriesByCategoryID(categoryID)).fold(
          (failure) => emit(
        state.copyWith(
          homeStatus: HomeStatus.getStoriesError,
          errorMessage: failure.message,
        ),
      ),

          (data) => emit(
        state.copyWith(
          homeStatus: HomeStatus.getStoriesSuccess,
          stories: data,
        ),
      ),
    );
  }
}
