import 'package:shared/responses/category_response.dart';

enum CategoriesStatus {
  init,
  createLoading,
  createError,
  createSuccess,
  getLoading,
  getError,
  getSuccess,
  deleteLoading,
  deleteError,
  deleteSuccess,
}

class CategoriesStates {
  final String errorMessage;
  final CategoriesStatus status;
  final List<CategoryResponse> categories;

  CategoriesStates({
    this.status = CategoriesStatus.init,
    this.errorMessage = '',
    this.categories = const [],
  });

  bool get isInit => status == CategoriesStatus.init;
  bool get isCreateLoading => status == CategoriesStatus.createLoading;

  bool get isCreateError => status == CategoriesStatus.createError;

  bool get isCreateSuccess => status == CategoriesStatus.createSuccess;
  bool get isGetLoading => status == CategoriesStatus.getLoading;
  bool get isGetError => status == CategoriesStatus.getError;
  bool get isGetSuccess => status == CategoriesStatus.getSuccess;
  bool get isDeleteLoading => status == CategoriesStatus.deleteLoading;
  bool get isDeleteError => status == CategoriesStatus.deleteError;
  bool get isDeleteSuccess => status == CategoriesStatus.deleteSuccess;

  CategoriesStates copyWith({
    final String? errorMessage,
    final CategoriesStatus? status,
    final List<CategoryResponse>? categories,
  }) {
    return CategoriesStates(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      categories: categories ?? this.categories
    );
  }
}
