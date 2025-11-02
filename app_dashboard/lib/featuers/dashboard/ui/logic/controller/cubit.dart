import 'package:app_dashboard/featuers/dashboard/ui/logic/controller/stats.dart';
import 'package:app_dashboard/featuers/dashboard/ui/logic/dashboard_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<DashboardStats> {
  final DashboardRepo dashboardRepo;

  DashboardCubit({required this.dashboardRepo}) : super(DashboardStats());

  Future<void> getDashboardStats() async {
    emit(state.copyWith(status: DashboardStatus.loading));
    (await dashboardRepo.getDashboardStats()).fold(
      (failure) => emit(
        state.copyWith(
          status: DashboardStatus.error,
          errorMessage: failure.message,
        ),
      ),
      (response) => emit(
        state.copyWith(
          status: DashboardStatus.success,
          statisticsResponse: response,
        ),
      ),
    );
  }
}
