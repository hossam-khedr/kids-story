import 'package:app_dashboard/featuers/categories/ui/logic/categories_repo.dart';
import 'package:app_dashboard/featuers/categories/ui/logic/controller/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesRepo categoriesRepo;

  CategoriesCubit({required this.categoriesRepo}) : super(CategoriesStates());

  Future<void> createCategory({
    required String title,
    required String imageUrl,
  }) async {
    emit(state.copyWith(status: CategoriesStatus.createLoading));
    (await categoriesRepo.createCategory(title: title, image: imageUrl)).fold(
      (failure) {
        emit(
          state.copyWith(
            status: CategoriesStatus.createError,
            errorMessage: failure.message,
          ),
        );
      },
      (success)async {
        emit(state.copyWith(status: CategoriesStatus.createSuccess));
        await fitchCategories();
      },
    );

  }

  Future<void> fitchCategories() async {
    emit(state.copyWith(status: CategoriesStatus.getLoading));
    (await categoriesRepo.fitchCategories()).fold(
      (failure) {
        emit(
          state.copyWith(
            status: CategoriesStatus.getError,
            errorMessage: failure.message,
          ),
        );
      },
      (date) {

        emit(
          state.copyWith(status: CategoriesStatus.getSuccess, categories: date),
        );
      },
    );
  }

  Future<void> deleteCategory({required int categoryId}) async {
    emit(state.copyWith(status: CategoriesStatus.deleteLoading));
    (await categoriesRepo.deleteCategory(categoryId)).fold(
      (failure) {
        emit(
          state.copyWith(
            status: CategoriesStatus.deleteError,
            errorMessage: failure.message,
          ),
        );
      },
      (success) async {
        emit(state.copyWith(status: CategoriesStatus.deleteSuccess));
        await fitchCategories();
      },
    );
  }
}
