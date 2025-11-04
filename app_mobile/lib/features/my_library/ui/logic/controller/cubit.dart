import 'package:app_mobile/features/my_library/ui/logic/controller/states.dart';
import 'package:app_mobile/features/my_library/ui/logic/library_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LibraryCubit extends Cubit<LibraryStates> {
  final LibraryRepo libraryRepo;

  LibraryCubit({required this.libraryRepo}) : super(LibraryStates());

  Future<void> addStoryToLibrary(int storyID) async {
    await libraryRepo.addStoryToLibrary(storyID);
  }

  Future<void> getStoriesFromLibrary() async {
    emit(state.copyWith(status: LibraryStatus.loading));
    (await libraryRepo.getStoriesFromLibrary()).fold(
      (failure) => emit(
        state.copyWith(
          status: LibraryStatus.error,
          errorMessage: failure.message,
        ),
      ),
      (response) => emit(
        state.copyWith(status: LibraryStatus.success, response: response),
      ),
    );
  }
}
