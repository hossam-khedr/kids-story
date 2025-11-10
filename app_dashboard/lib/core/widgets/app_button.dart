import 'package:app_dashboard/app/responsive_helper.dart';
import 'package:app_dashboard/core/dashboard_color.dart';
import 'package:flutter/material.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

class AppButton extends StatelessWidget {
  final double? width;
  final double? height;
  final void Function()? onPressed;
  final String text;
  final Color? color;
  final Color? textColor;
  final double? textFontSize;
  final Widget? icon;

  const AppButton({
    super.key,
    this.width,
    this.height ,
    this.onPressed,
    required this.text,
    this.color,
    this.textColor,
    this.textFontSize,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? context.responsive.screenHeight * 0.06,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(0),
          shadowColor: const WidgetStatePropertyAll(Colors.transparent),
          backgroundColor: WidgetStatePropertyAll(
            color ?? DashboardColors.pink,
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            icon ?? const SizedBox.shrink(),
            Expanded(
              child: AppText(
                data: text,
                style: TextStyle(
                  color: textColor ?? DashboardColors.whait,
                  fontSize:context.responsive.isMobile ? 8:12,

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
