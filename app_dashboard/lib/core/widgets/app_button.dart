import 'package:app_dashboard/core/dashboard_color.dart';
import 'package:flutter/material.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

class AppButton extends StatelessWidget {
  final double? width;
  final double? height;
  final void Function()? onPressed;
  final String text;

  const AppButton({super.key, this.width, this.height, this.onPressed, required this.text, });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? ResponsiveHelper.r.height(7.5),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(DashboardColors.pink),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        onPressed: onPressed,
        child: AppText(
          data: text,
          style: TextStyle(color: DashboardColors.whait,fontSize: ResponsiveHelper.r.font(10)),
        ),
      ),
    );
  }
}
