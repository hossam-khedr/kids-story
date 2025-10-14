import 'package:kids_story_ai/app/index.dart';
import 'package:flutter/material.dart';




class AllCategoriesButton extends StatelessWidget {
  const AllCategoriesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        padding: ResponsiveHelper.r.paddingAll(3),
        decoration: BoxDecoration(
            color: AppColors.primary.withAlpha(80),
            borderRadius: BorderRadius.circular(15)
        ),
        child: AppText(
          data: AppStrings.all.tr(),
          style: TextStyle(
            color: AppColors.primary,
            fontSize: ResponsiveHelper.r.font(18),
          ),
        ),
      ),
    );
  }
}
