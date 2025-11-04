
import 'package:flutter/material.dart';
import 'package:shared/core/constants/app_colors.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final double? borderRadius;
  const AuthButton({super.key, required this.text, this.onTap, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        //width: double.infinity,
        height: ResponsiveHelper.r.height(6.5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius??10),
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
