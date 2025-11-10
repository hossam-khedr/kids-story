import 'package:app_dashboard/app/responsive_helper.dart';
import 'package:app_dashboard/core/dashboard_color.dart';
import 'package:app_dashboard/featuers/root/ui/widgets/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

class SideBarItem extends StatelessWidget {
  final SideBarItemModel model;
  final bool isSelectedItem;
  final void Function()? onTap;

  const SideBarItem({
    super.key,
    required this.model,
    this.onTap,
    required this.isSelectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(context.responsive.spacingM),
        decoration: BoxDecoration(
          color: isSelectedItem
              ? DashboardColors.pink.withAlpha(40)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          spacing: context.responsive.screenWidth * 0.01,
          children: [
            SvgPicture.asset(
              model.icon,
              width: context.responsive.responsiveValue(
                mobile: context.screenWidth * 0.03,
                desktop: context.screenWidth * 0.015
              ),
              color: isSelectedItem
                  ? DashboardColors.pink
                  : DashboardColors.darkGray,
            ),
            AppText(
              data: model.title,
              style: TextStyle(
                color: isSelectedItem
                    ? DashboardColors.pink
                    : DashboardColors.darkGray,
                fontWeight: FontWeight.w400,
                fontSize: context.responsive.fontSize(8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
