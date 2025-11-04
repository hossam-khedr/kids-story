import 'dart:typed_data';

import 'package:app_dashboard/featuers/dashboard/ui/logic/controller/stats.dart';
import 'package:app_dashboard/featuers/dashboard/ui/logic/dashboard_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

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

  Future<void> createCategory({
    required String name,
    required String description,
    required XFile file,
  }) async {
    emit(state.copyWith(status: DashboardStatus.createCategoryLoading));
    (await dashboardRepo.createCategory(
      name: name,
      description: description,
      file: file,
    )).fold(
      (failure) => emit(
        state.copyWith(
          status: DashboardStatus.createCategoryError,
          errorMessage: failure.message,
        ),
      ),
      (success) =>
          emit(state.copyWith(status: DashboardStatus.createCategorySuccess)),
    );
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      emit(state.copyWith(status: DashboardStatus.selectedFileError,errorMessage: 'Pleas select image'));
      return;
    }
    final bytes = await pickedFile.readAsBytes();
    emit(
      state.copyWith(
        status: DashboardStatus.selectedFileSuccess,
        file: pickedFile,
        imageBytes: bytes as Uint8List?,
      ),
    );
    }
}
