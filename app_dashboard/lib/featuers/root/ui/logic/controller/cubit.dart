import 'package:app_dashboard/featuers/root/ui/logic/controller/stats.dart';
import 'package:app_dashboard/featuers/root/ui/logic/repo/root_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootCubit extends Cubit<RootStats>{
  final RootRepo rootRepo;
  RootCubit({required this.rootRepo}):super(RootStats());


  Future<void> searchStoriesByTitle({
    required String search,
    required int page,
    required int limit,
  }) async {
    emit(state.copyWith(rootStatus: RootStatus.searchLoading));
    (await rootRepo.searchStoriesByTitle(
      search: search,
      page: page,
      limit: limit,
    )).fold(
          (failure) {
        emit(
          state.copyWith(
            rootStatus: RootStatus.searchError,
            errorMessage: failure.message,
          ),
        );
      },
          (data) {
        emit(
          state.copyWith(
            rootStatus: RootStatus.searchSuccess,
            storiesSearch: data,
          ),
        );
      },
    );
  }

  void clearSearch() {
    emit(state.copyWith(
      rootStatus: RootStatus.init,
      storiesSearch: [],
    ));
  }
}