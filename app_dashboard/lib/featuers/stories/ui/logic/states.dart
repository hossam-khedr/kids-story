sealed class StoriesStates{}

class InitStoryState extends StoriesStates{}
class CreateStoryLoading extends StoriesStates{}
class CreateStoryError extends StoriesStates{
  final String errorMessage;
  CreateStoryError({required this.errorMessage});
}
class CreateStorySuccess extends StoriesStates{}