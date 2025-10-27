
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout_states.dart';

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
