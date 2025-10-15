import 'package:kids_story_ai/features/story_details/data/responses/story_details_response.dart';

enum StoryDetailsStatus {
  init,
  getStoryLoading,
  getStoryError,
  getStorySuccess,
  stopSpeakState,
  playSpeakState
}

class StoryDetailsStates {
  StoryDetailsStatus status;
  final String errorMessage;
  final StoryDetailsResponse? data;
  final bool isSpeak;

  StoryDetailsStates({
    this.status = StoryDetailsStatus.init,
    this.errorMessage = '',
    this.data,
    this.isSpeak = true,
  });

  bool get isGetStoryLoading => status == StoryDetailsStatus.getStoryLoading;

  bool get isGetStoryError => status == StoryDetailsStatus.getStoryError;

  bool get isGetStorySuccess => status == StoryDetailsStatus.getStorySuccess;
  bool get isPlaySpeak => status == StoryDetailsStatus.playSpeakState;
  bool get isPauseSpeak => status == StoryDetailsStatus.stopSpeakState;

  StoryDetailsStates copyWith({
    final StoryDetailsStatus? status,
    final String? errorMessage,
    final StoryDetailsResponse? data,
    final bool? isSpeak
  }) {
    return StoryDetailsStates(
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      isSpeak: isSpeak ?? this.isSpeak
    );
  }
}
