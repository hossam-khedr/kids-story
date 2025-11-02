import 'package:app_dashboard/core/dashboard_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

class DashboardInfoCard extends StatelessWidget {
  final String title;
  final String counter;
  final Color cardColor;
  final String icon;

  const DashboardInfoCard({
    super.key,
    required this.title,
    required this.counter,
    required this.cardColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ResponsiveHelper.r.paddingAll(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: ResponsiveHelper.r.height(2),
            children: [
              AppText(
                data: title,
                style: TextStyle(
                  color: DashboardColors.whait,
                  fontSize: ResponsiveHelper.r.font(8),
                  fontWeight: FontWeight.w200,
                ),
              ),
              AppText(
                data: counter,
                style: TextStyle(
                  color: DashboardColors.whait,
                  fontSize: ResponsiveHelper.r.font(16),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            padding: ResponsiveHelper.r.paddingAll(5),
            decoration: BoxDecoration(
              color: DashboardColors.whait.withAlpha(40),
              borderRadius: BorderRadius.circular(20),
            ),
            child: SvgPicture.asset(
              icon,
              color: DashboardColors.whait,
              width: ResponsiveHelper.r.width(2.5),
            ),
          ),
        ],
      ),
    );
  }
}
