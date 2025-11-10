import 'package:shared/responses/story_response.dart';

enum RootStatus{init,searchLoading,
  searchError,
  searchSuccess,}

class RootStats{
  final String errorMessage;
  final RootStatus rootStatus;
  final List<Story>storiesSearch;

  RootStats({
    this.rootStatus = RootStatus.init,
    this.storiesSearch = const [],
    this.errorMessage = '',
});

  bool get isSearchLoading => rootStatus == RootStatus.searchLoading;
  bool get isSearchError => rootStatus == RootStatus.searchError;
  bool get isSearchSuccess => rootStatus == RootStatus.searchSuccess;


  RootStats copyWith({
    final String? errorMessage,
    final RootStatus? rootStatus,
    final List<Story>?storiesSearch
  }) {
    return RootStats(
      errorMessage: errorMessage ?? this.errorMessage,

      rootStatus: rootStatus ?? this.rootStatus,

      storiesSearch: storiesSearch ?? this.storiesSearch,
    );
  }
}