import 'package:app_dashboard/app/responsive_helper.dart';
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
      padding:EdgeInsets.all(context.responsive.spacingM),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: context.responsive.screenHeight *0.02,
            children: [
              AppText(
                data: title,
                style: TextStyle(
                  color: DashboardColors.whait,
                  fontSize: context.responsive.isMobile?10:12,
                  fontWeight: FontWeight.w200,
                ),
              ),
              AppText(
                data: counter,
                style: TextStyle(
                  color: DashboardColors.whait,
                  fontSize: context.responsive.isMobile?16:20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(context.responsive.spacingXS),
            decoration: BoxDecoration(
              color: DashboardColors.whait.withAlpha(40),
              borderRadius: BorderRadius.circular(20),
            ),
            child: SvgPicture.asset(
              icon,
              color: DashboardColors.whait,
              width: context.responsive.isMobile?20:25,
            ),
          ),
        ],
      ),
    );
  }
}
