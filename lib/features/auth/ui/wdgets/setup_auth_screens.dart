import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class SetupAuthScreens extends StatelessWidget {
  final Widget body;
  const SetupAuthScreens({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 0.7, 1.0,],
          colors: [
            AppColors.foreground,
            AppColors.redAccent,
            AppColors.secondary,
          ],
        ),
      ),
      child: body,
    );
  }
}
