import 'package:flutter/material.dart';
import 'package:kids_story_ai/app/index.dart';

class AppBarIcon extends StatelessWidget {
  final IconData icon;
  final void Function()? onBack;
  const AppBarIcon({super.key, required this.icon, this.onBack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBack,
      child: Padding(
        padding: ResponsiveHelper.r.paddingAll(6),
        child: Container(
          width: ResponsiveHelper.r.width(12),
          height: ResponsiveHelper.r.height(5),
          decoration: BoxDecoration(
            color: AppColors.whit,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Icon(icon,color: AppColors.primary,),
        ),
      ),
    );
  }
}
