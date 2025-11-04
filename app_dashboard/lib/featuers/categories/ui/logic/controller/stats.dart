import 'package:shared/responses/category_response.dart';

enum CategoriesStatus {
  init,
  loading,
  error,
  success,
  deleteLoading,
  deleteError,
  deleteSuccess,
}

class CategoriesStats {
  final String errorMessage;
  final CategoriesStatus status;
  final List<CategoryResponse> data;
  final int? deletingId;

  CategoriesStats({
    this.errorMessage = '',
    this.status = CategoriesStatus.init,
    this.data = const [],
    this.deletingId
  });

  bool get isLoading => status == CategoriesStatus.loading;

  bool get isError => status == CategoriesStatus.error;

  bool get isSuccess => status == CategoriesStatus.success;
  bool get isDeleteLoading => status == CategoriesStatus.deleteLoading;
  bool get isDeleteError => status == CategoriesStatus.deleteError;
  bool get isDeleteSuccess => status == CategoriesStatus.deleteSuccess;

  CategoriesStats copyWith({
    final String? errorMessage,
    final CategoriesStatus? status,
    final List<CategoryResponse>? data,
    final int? deletingId,
  }) {
    return CategoriesStats(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      data: data ?? this.data,
      deletingId: deletingId
    );
  }
}
