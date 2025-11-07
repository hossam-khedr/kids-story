import 'package:shared/responses/story_response.dart';

enum StoriesStatus{init,loading,error,success}


class StoriesStats{
  final String errorMessage;
  final StoriesStatus status;
  final StoriesResponse?response;

  StoriesStats({
    this.errorMessage = '',
    this.status = StoriesStatus.init,
    this.response,
});

  bool get isLoading => status == StoriesStatus.loading;
  bool get isError => status == StoriesStatus.error;
  bool get isSuccess => status == StoriesStatus.success;

  StoriesStats copyWith({
    final String? errorMessage,
    final StoriesStatus? status,
    final StoriesResponse?response,
}){
    return StoriesStats(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      response: response ?? this.response,
    );
}
}