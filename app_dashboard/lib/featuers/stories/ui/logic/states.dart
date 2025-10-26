import 'package:shared/responses/story_response.dart';



enum StoriesStatus {
  init,
  createLoading,
  createError,
  createSuccess,
  getLoading,
  getError,
  getSuccess,
  deleteLoading,
  deleteError,
  deleteSuccess,
}

class StoriesStates {
  final String errorMessage;
  final StoriesStatus status;
  final List<StoryResponse> stories;

  StoriesStates({
    this.status = StoriesStatus.init,
    this.errorMessage = '',
    this.stories = const [],
  });

  bool get isInit => status == StoriesStatus.init;
  bool get isCreateLoading => status == StoriesStatus.createLoading;

  bool get isCreateError => status == StoriesStatus.createError;

  bool get isCreateSuccess => status == StoriesStatus.createSuccess;
  bool get isGetLoading => status == StoriesStatus.getLoading;
  bool get isGetError => status == StoriesStatus.getError;
  bool get isGetSuccess => status == StoriesStatus.getSuccess;
  bool get isDeleteLoading => status == StoriesStatus.deleteLoading;
  bool get isDeleteError => status == StoriesStatus.deleteError;
  bool get isDeleteSuccess => status == StoriesStatus.deleteSuccess;

  StoriesStates copyWith({
    final String? errorMessage,
    final StoriesStatus? status,
    final List<StoryResponse>? stories,
  }) {
    return StoriesStates(
        errorMessage: errorMessage ?? this.errorMessage,
        status: status ?? this.status,
        stories: stories ?? this.stories
    );
  }
}

// sealed class StoriesStates {
//   final List<StoryResponse> stories;
//
//   StoriesStates({this.stories = const []});
// }
//
// class InitStoryState extends StoriesStates {}
//
// class CreateStoryLoading extends StoriesStates {}
//
// class CreateStoryError extends StoriesStates {
//   final String errorMessage;
//
//   CreateStoryError({required this.errorMessage});
// }
//
// class CreateStorySuccess extends StoriesStates {}
//
// class GetStorySuccess extends StoriesStates {
//   final List<StoryResponse> stories;
//
//   GetStorySuccess(this.stories);
// }
//
// class GetStoryLoading extends StoriesStates {}
//
// class GetStoryError extends StoriesStates {
//   final String errorMessage;
//
//   GetStoryError(this.errorMessage);
// }
//
// class DeleteStorySuccess extends StoriesStates {}
//
// class DeleteStoryLoading extends StoriesStates {}
//
// class DeleteStoryError extends StoriesStates {
//   final String errorMessage;
//
//   DeleteStoryError(this.errorMessage);
// }
