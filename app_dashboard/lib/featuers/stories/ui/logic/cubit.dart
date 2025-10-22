import 'package:app_dashboard/data/repos/stories/stories_repo.dart';
import 'package:app_dashboard/featuers/stories/ui/logic/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoriesCubit extends Cubit<StoriesStates>{
  final StoriesRepo storiesRepo;
  StoriesCubit({required this.storiesRepo}):super(InitStoryState());

  Future<void>createStory({ required String title,
    required String image,
    required String desc,
    required String content,
    required int id,})async{
    emit(CreateStoryLoading());
    (await storiesRepo.createStory(title: title, image: image, desc: desc, content: content, id: id)).fold(
        (failure){
          emit(CreateStoryError(errorMessage: failure.message));
        }, (success){
          emit(CreateStorySuccess());
    });
  }
}