import 'package:app_dashboard/featuers/stories/ui/logic/controller/stats.dart';
import 'package:app_dashboard/featuers/stories/ui/logic/repo/stories_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoriesCubit extends Cubit<StoriesStats> {
  final StoriesRepo repo;

  StoriesCubit({required this.repo}) :super(StoriesStats());


  Future<void> getAllStories() async {
    emit(state.copyWith(status: StoriesStatus.loading));
    (await repo.getAllStories()).fold(
            (failure) =>
            emit(state.copyWith(
                status: StoriesStatus.error, errorMessage: failure.message)),
            (data) =>
            emit(state.copyWith(status: StoriesStatus.success, response: data))
    );
  }
}