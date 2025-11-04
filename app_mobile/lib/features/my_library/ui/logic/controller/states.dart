


import 'package:shared/responses/library_response.dart';

enum LibraryStatus{init,loading,error,success}
class LibraryStates{
  final String errorMessage;
  final List<LibraryResponse>response;
  final LibraryStatus status;

  LibraryStates({
    this.status = LibraryStatus.init,
    this.errorMessage = '',
    this.response = const[],
});

  bool get isLoading => status == LibraryStatus.loading;
  bool get isError => status == LibraryStatus.error;
  bool get isSuccess => status == LibraryStatus.success;

  LibraryStates copyWith({
    final String? errorMessage,
    final List<LibraryResponse>?response,
    final LibraryStatus? status,
}){
    return LibraryStates(
      status:status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      response: response ?? this.response,
    );
  }
}