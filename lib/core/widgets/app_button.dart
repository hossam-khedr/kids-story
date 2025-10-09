import 'package:flutter/material.dart';
import 'package:kids_story_ai/core/constants/app_colors.dart';
import 'package:kids_story_ai/core/utils/responsive_helper.dart';
import 'package:kids_story_ai/core/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const AppButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        //width: double.infinity,
        height: ResponsiveHelper.r.height(6.5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            end: Alignment.centerRight,
              begin:Alignment.centerLeft ,
              colors: [
            AppColors.foreground,
            AppColors.redAccent,
          ])
        ),
        child: AppText(data: text,style: Theme.of(context).textTheme.titleSmall,),
      ),
    );
  }
}
