import 'package:flutter/material.dart';

import '../../utils/helpers/responsive_helper.dart';
import '../constants/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  final double? expandedHeight;
  final Widget child;

  const CustomAppBar({super.key, this.expandedHeight, required this.child});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      pinned: false,
      expandedHeight: expandedHeight ?? ResponsiveHelper.r.height(24),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          padding: ResponsiveHelper.r.paddingSymmetric(
            vertical: 20,
            horizontal: 30,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(40),
              bottomLeft: Radius.circular(40),
            ),
            gradient: LinearGradient(
              stops: [0.3, 2.0],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [AppColors.pink, AppColors.primary],
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
