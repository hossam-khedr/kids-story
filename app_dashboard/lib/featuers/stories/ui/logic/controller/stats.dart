import 'package:shared/responses/story_response.dart';

enum StoriesStatus{init,loading,error,success,deleteLoading,deleteError,deleteSuccess}


class StoriesStats{
  final String errorMessage;
  final StoriesStatus status;
  final StoriesResponse?response;
  final int? idDeleted;
   List<Story>stories;

  StoriesStats({
    this.errorMessage = '',
    this.status = StoriesStatus.init,
    this.response,
    this.idDeleted,
    this.stories = const[],
});

  bool get isLoading => status == StoriesStatus.loading;
  bool get isError => status == StoriesStatus.error;
  bool get isSuccess => status == StoriesStatus.success;
  bool get isDeleteSuccess => status == StoriesStatus.deleteSuccess;
  bool get isDeleteError => status == StoriesStatus.deleteError;
  bool get isDeleteLoading => status == StoriesStatus.deleteLoading;

  StoriesStats copyWith({
    final String? errorMessage,
    final StoriesStatus? status,
    final StoriesResponse?response,
    final int? idDeleted,
    final List<Story>?stories,
}){
    return StoriesStats(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      response: response ?? this.response,
      idDeleted: idDeleted ?? this.idDeleted,
      stories: stories ?? this.stories,
    );
}
}