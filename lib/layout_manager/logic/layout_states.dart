enum LayoutStatus { init, changeBottomNavBarTap,}

class LayoutStates {
  final LayoutStatus layoutStatus;
  final int bottomNavIndex;


  LayoutStates({
    this.layoutStatus = LayoutStatus.init,
    this.bottomNavIndex = 0,

  });

  LayoutStates copyWith({
    final LayoutStatus? layoutStatus,
    final int? bottomNavIndex,

  }) {
    return LayoutStates(
      layoutStatus: layoutStatus ?? this.layoutStatus,
      bottomNavIndex: bottomNavIndex ?? this.bottomNavIndex,

    );
  }
}