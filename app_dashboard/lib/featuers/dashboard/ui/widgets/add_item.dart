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
        padding: ResponsiveHelper.r.paddingAll(14),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          spacing: ResponsiveHelper.r.width(1),
          children: [
            Container(
              padding: ResponsiveHelper.r.paddingAll(8),
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.add, color: DashboardColors.whait),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: ResponsiveHelper.r.height(1),
              children: [
                AppText(
                  data: title,
                  style: TextStyle(
                    color: DashboardColors.darkGray,
                    fontWeight: FontWeight.bold,
                    fontSize: ResponsiveHelper.r.font(10),
                  ),
                ),
                AppText(
                  data: subTitle,
                  style: TextStyle(
                    color: DashboardColors.darkGray,
                    fontWeight: FontWeight.normal,
                    fontSize: ResponsiveHelper.r.font(8),
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
