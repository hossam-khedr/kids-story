import 'package:app_mobile/features/story_details/ui/logic/controller/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../services/text_to_speck_service.dart';
import '../story_details_repo.dart';

class StoryDetailsCubit extends Cubit<StoryDetailsStates> {
  final StoryDetailsRepo storyDetailsRepo;

  StoryDetailsCubit({required this.storyDetailsRepo})
    : super(StoryDetailsStates());

  Future<void> getStoryByID(int storyID) async {
    emit(state.copyWith(status: StoryDetailsStatus.getStoryLoading));
    (await storyDetailsRepo.getStoryByID(storyID)).fold(
      (failure) => emit(
        state.copyWith(
          status: StoryDetailsStatus.getStoryError,
          errorMessage: failure.message,
        ),
      ),
      (data) => emit(
        state.copyWith(status: StoryDetailsStatus.getStorySuccess, data: data),
      ),
    );
  }

  Future<void> playSpeck(String text)async {
   await TextToSpeakService.speak(text);
    emit(
      state.copyWith(status: StoryDetailsStatus.playSpeakState, isSpeak: true),
    );
  }

  Future<void> pauseSpeck()async {
   await TextToSpeakService.pause();
    emit(
      state.copyWith(status: StoryDetailsStatus.stopSpeakState, isSpeak: false),
    );
  }

  void readToggle() {
    //state.isRead = !state.isRead;
    emit(
      state.copyWith(
        status: StoryDetailsStatus.readToggleState,
        isRead: !state.isRead,
      ),
    );
  }
}
