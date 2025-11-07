import 'dart:typed_data';

import 'package:app_dashboard/core/responses/categories_names_response.dart';
import 'package:app_dashboard/core/responses/dashboard_stats_response.dart';
import 'package:image_picker/image_picker.dart';

enum DashboardStatus {
  init,
  loading,
  error,
  success,
  selectedFileSuccess,
  selectedFileError,
  createCategoryLoading,
  createCategoryError,
  createCategorySuccess,
  createStorySuccess,
  createStoryLoading,
  createStoryError,
  getNamesLoading,
  getNamesError,
  getNamesSuccess,
  selectCategory,
}

class DashboardStats {
  final String errorMessage;
   String? selectedCategory;
  final StatisticsResponse? statisticsResponse;
  final DashboardStatus status;
  final XFile? file;
  final Uint8List? imageBytes;
  final List<CategoriesNamesResponse>namesResponse;

  DashboardStats({
    this.errorMessage = '',
    this.status = DashboardStatus.init,
    this.statisticsResponse,
    this.file,
    this.imageBytes,
    this.namesResponse = const [],
    this.selectedCategory,
  });

  bool get isLoading => status == DashboardStatus.loading;

  bool get isError => status == DashboardStatus.error;

  bool get isSuccess => status == DashboardStatus.success;
  bool get isCreateCategorySuccess => status == DashboardStatus.createCategorySuccess;
  bool get isCreateCategoryError => status == DashboardStatus.createCategoryError;
  bool get isCreateCategoryLoading => status == DashboardStatus.createCategoryLoading;
  bool get isCreateStoryLoading => status == DashboardStatus.createStoryLoading;
  bool get isCreateStoryError => status == DashboardStatus.createStoryError;
  bool get isCreateStorySuccess => status == DashboardStatus.createStorySuccess;
  bool get isSelectedFileError => status == DashboardStatus.selectedFileError;
  bool get isSelectedFileSuccess => status == DashboardStatus.selectedFileSuccess;
  bool get isGetNamesLoading => status == DashboardStatus.getNamesLoading;
  bool get isGetNamesSuccess => status == DashboardStatus.getNamesSuccess;
  bool get isGetNamesError => status == DashboardStatus.getNamesError;
  bool get isSelectedCategory => status == DashboardStatus.selectCategory;

  DashboardStats copyWith({
    final String? errorMessage,
    final StatisticsResponse? statisticsResponse,
    final DashboardStatus? status,
    final XFile? file,
    final Uint8List? imageBytes,
    final List<CategoriesNamesResponse>?namesResponse,
     String? selectedCategory,
  }) {
    return DashboardStats(
      errorMessage: errorMessage ?? this.errorMessage,
      statisticsResponse: statisticsResponse ?? this.statisticsResponse,
      status: status ?? this.status,
      file: file ?? this.file,
      imageBytes: imageBytes ?? this.imageBytes,
      namesResponse: namesResponse ?? this.namesResponse,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}
