
import '../../../data/responses/story_details_response.dart';

enum StoryDetailsStatus {
  init,
  getStoryLoading,
  getStoryError,
  getStorySuccess,
  stopSpeakState,
  playSpeakState,
  readToggleState,
}

class StoryDetailsStates {
  StoryDetailsStatus status;
  final String errorMessage;
  final StoryDetailsResponse? data;
  final bool isSpeak;
   bool isRead;

  StoryDetailsStates({
    this.status = StoryDetailsStatus.init,
    this.errorMessage = '',
    this.data,
    this.isSpeak = false,
    this.isRead = false,
  });

  bool get isGetStoryLoading => status == StoryDetailsStatus.getStoryLoading;

  bool get isGetStoryError => status == StoryDetailsStatus.getStoryError;

  bool get isGetStorySuccess => status == StoryDetailsStatus.getStorySuccess;
  bool get isPlaySpeak => status == StoryDetailsStatus.playSpeakState;
  bool get isPauseSpeak => status == StoryDetailsStatus.stopSpeakState;
  bool get isReadToggle => status == StoryDetailsStatus.readToggleState;

  StoryDetailsStates copyWith({
    final StoryDetailsStatus? status,
    final String? errorMessage,
    final StoryDetailsResponse? data,
    final bool? isSpeak,
     bool? isRead,
  }) {
    return StoryDetailsStates(
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      isSpeak: isSpeak ?? this.isSpeak,
        isRead: isRead ?? this.isRead,
    );
  }
}
