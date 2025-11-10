import 'package:app_dashboard/app/responsive_helper.dart';
import 'package:app_dashboard/core/dashboard_color.dart';
import 'package:flutter/material.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

class AddItem extends StatelessWidget {
  final Color color;
  final Color buttonColor;
  final String title;
  final String subTitle;
  final void Function()? onTap;

  const AddItem({
    super.key,
    required this.color,
    required this.buttonColor,
    required this.title,
    required this.subTitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.none,
        padding: EdgeInsets.all(context.responsive.spacingM),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          spacing: context.responsive.screenWidth * 0.01,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(context.responsive.spacingS),
              decoration: BoxDecoration(
                color: buttonColor,
                shape: BoxShape.circle
              ),
              child: const Center(child: Icon(Icons.add, color: DashboardColors.whait,size: 15,)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: context.responsive.screenHeight * 0.01,
              children: [
                AppText(
                  data: title,
                  style: TextStyle(
                    color: DashboardColors.darkGray,
                    fontWeight: FontWeight.bold,
                    fontSize: context.responsive.isMobile?8:12,
                  ),
                ),
                AppText(
                  data: subTitle,
                  style: TextStyle(
                    color: DashboardColors.darkGray,
                    fontWeight: FontWeight.normal,
                    fontSize: context.responsive.isMobile?6:10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
