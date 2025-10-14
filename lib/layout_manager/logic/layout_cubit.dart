import 'package:kids_story_ai/app/index.dart';
import 'package:kids_story_ai/layout_manager/logic/layout_states.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutStates());

  void changeBottomNavBarTap(int index) {
    emit(
      state.copyWith(
        layoutStatus: LayoutStatus.changeBottomNavBarTap,
        bottomNavIndex: index,
      ),
    );
  }
}
