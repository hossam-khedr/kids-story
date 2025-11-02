import 'package:app_dashboard/featuers/dashboard/data/responses/dashboard_stats_response.dart';

enum DashboardStatus { init, loading, error, success }

class DashboardStats {
  final String errorMessage;
  final StatisticsResponse? statisticsResponse;
  final DashboardStatus status;

  DashboardStats({
    this.errorMessage = '',
    this.status = DashboardStatus.init,
    this.statisticsResponse,
  });

  bool get isLoading => status == DashboardStatus.loading;

  bool get isError => status == DashboardStatus.error;

  bool get isSuccess => status == DashboardStatus.success;

  DashboardStats copyWith({
    final String? errorMessage,
    final StatisticsResponse? statisticsResponse,
    final DashboardStatus? status,
  }) {
    return DashboardStats(
      errorMessage: errorMessage ?? this.errorMessage,
      statisticsResponse: statisticsResponse ?? this.statisticsResponse,
      status: status ?? this.status,
    );
  }
}
