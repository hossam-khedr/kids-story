import 'package:app_dashboard/featuers/categories/ui/logic/controller/stats.dart';
import 'package:app_dashboard/featuers/categories/ui/logic/repo/categories_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesStats> {
  final CategoriesRepo repo;

  CategoriesCubit({required this.repo}) : super(CategoriesStats());

  Future<void> getCategories() async {
    emit(state.copyWith(status: CategoriesStatus.loading));
    (await repo.getCategories()).fold(
      (failure) => emit(
        state.copyWith(
          status: CategoriesStatus.error,
          errorMessage: failure.message,
        ),
      ),
      (data) =>
          emit(state.copyWith(status: CategoriesStatus.success, data: data)),
    );
  }

  Future<void> deleteCategory({required int id}) async {
    emit(
      state.copyWith(status: CategoriesStatus.deleteLoading, deletingId: id),
    );
    (await repo.deleteCategory(id: id)).fold(
      (failure) => emit(
        state.copyWith(
          status: CategoriesStatus.deleteError,
          errorMessage: failure.message,
          deletingId: null,
        ),
      ),
      (success) {
        final updatedList = state.data
            .where((category) => category.id != id)
            .toList();
        emit(
          state.copyWith(
            status: CategoriesStatus.deleteSuccess,
            deletingId: null,
            data: updatedList,
          ),
        );
      },
    );

  }
}
