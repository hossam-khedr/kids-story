import 'package:app_dashboard/core/dashboard_color.dart';
import 'package:app_dashboard/featuers/root/widgets/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

class SideBarItem extends StatelessWidget {
  final SideBarItemModel model;
  final bool isSelectedItem;
  final void Function()? onTap;

  const SideBarItem(
      {super.key, required this.model,  this.onTap, required this.isSelectedItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        padding: ResponsiveHelper.r.paddingAll(8),
        decoration: BoxDecoration(
          color: isSelectedItem
              ? DashboardColors.pink.withAlpha(40)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          spacing: ResponsiveHelper.r.width(1),
          children: [
            SvgPicture.asset(
              model.icon,
              width: ResponsiveHelper.r.width(1.3),
              color: isSelectedItem
                  ? DashboardColors.pink
                  : DashboardColors.darkGray,
            ),
            AppText(data: model.title, style: TextStyle(
                color: isSelectedItem
                    ? DashboardColors.pink
                    : DashboardColors.darkGray,
                fontWeight: FontWeight.w400,
                fontSize: ResponsiveHelper.r.font(8)
            ),
            ),
          ],
        ),
      ),
    );
  }
}
