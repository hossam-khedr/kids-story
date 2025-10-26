import 'package:app_dashboard/data/repos/stories/stories_repo.dart';
import 'package:app_dashboard/featuers/stories/ui/logic/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoriesCubit extends Cubit<StoriesStates> {
  final StoriesRepo storiesRepo;

  StoriesCubit({required this.storiesRepo}) : super(StoriesStates());

  Future<void> createStory({
    required String title,
    required String image,
    required String desc,
    required String content,
    required int id,
  }) async {
    emit(state.copyWith(status: StoriesStatus.createLoading));
    (await storiesRepo.createStory(
      title: title,
      image: image,
      desc: desc,
      content: content,
      id: id,
    )).fold(
      (failure) {
        emit(
          state.copyWith(
            status: StoriesStatus.createError,
            errorMessage: failure.message,
          ),
        );
      },
      (success) {
        emit(state.copyWith(status: StoriesStatus.createSuccess));
      },
    );
  }

  Future<void> getStoryByCategory({required int id}) async {
    emit(state.copyWith(status: StoriesStatus.getLoading));
    (await storiesRepo.getStoriesByCategory(id)).fold(
      (failure) {
        emit(
          state.copyWith(
            status: StoriesStatus.getError,
            errorMessage: failure.message,
          ),
        );
      },
      (stories) {
        emit(
          state.copyWith(status: StoriesStatus.getSuccess, stories: stories),
        );
      },
    );
  }

  Future<void> deleteStory({required int id}) async {
    emit(state.copyWith(status: StoriesStatus.deleteLoading));
    (await storiesRepo.deleteStory(id)).fold(
      (failure) {
        emit(
          state.copyWith(
            status: StoriesStatus.deleteError,
            errorMessage: failure.message,
          ),
        );
      },
      (success) {
        emit(state.copyWith(status: StoriesStatus.deleteSuccess));
      },
    );
  }
}
