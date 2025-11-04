import 'dart:typed_data';

import 'package:app_dashboard/featuers/dashboard/data/responses/dashboard_stats_response.dart';
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
}

class DashboardStats {
  final String errorMessage;
  final StatisticsResponse? statisticsResponse;
  final DashboardStatus status;
  final XFile? file;
  final Uint8List? imageBytes;

  DashboardStats({
    this.errorMessage = '',
    this.status = DashboardStatus.init,
    this.statisticsResponse,
    this.file,
    this.imageBytes,
  });

  bool get isLoading => status == DashboardStatus.loading;

  bool get isError => status == DashboardStatus.error;

  bool get isSuccess => status == DashboardStatus.success;
  bool get isCreateCategorySuccess => status == DashboardStatus.createCategorySuccess;
  bool get isCreateCategoryError => status == DashboardStatus.createCategoryError;
  bool get isCreateCategoryLoading => status == DashboardStatus.createCategoryLoading;
  bool get isSelectedFileError => status == DashboardStatus.selectedFileError;
  bool get isSelectedFileSuccess => status == DashboardStatus.selectedFileSuccess;

  DashboardStats copyWith({
    final String? errorMessage,
    final StatisticsResponse? statisticsResponse,
    final DashboardStatus? status,
    final XFile? file,
    final Uint8List? imageBytes,
  }) {
    return DashboardStats(
      errorMessage: errorMessage ?? this.errorMessage,
      statisticsResponse: statisticsResponse ?? this.statisticsResponse,
      status: status ?? this.status,
      file: file ?? this.file,
      imageBytes: imageBytes ?? this.imageBytes,
    );
  }
}
