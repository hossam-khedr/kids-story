import 'package:app_dashboard/app/responsive_helper.dart';
import 'package:app_dashboard/core/dashboard_color.dart';
import 'package:app_dashboard/core/space_widget.dart';
import 'package:app_dashboard/core/svg_icon.dart';
import 'package:app_dashboard/featuers/root/ui/widgets/side_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

class RootSideBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  const RootSideBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      color: DashboardColors.whait,
      margin: EdgeInsets.zero,
      elevation: 0.5,
      child: Padding(
        padding: EdgeInsets.all(context.responsive.spacingM),
        child: Column(
          children: [
            Row(
              spacing: context.responsive.screenWidth * 0.01,
              children: [
                 CircleAvatar(
                  radius:context.isMobile?20:30 ,
                  backgroundColor: DashboardColors.pink,
                  child: const Icon(
                    Icons.book_outlined,
                    color: DashboardColors.whait,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      data: 'حكايات',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: DashboardColors.darkGray,
                        fontSize: context.responsive.fontSize(12),
                      ),
                    ),
                    AppText(
                      data: 'قصص الأطفال',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: DashboardColors.darkGray,
                        fontSize: context.responsive.fontSize(8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Space(space: context.responsive.screenHeight * 0.04),
            const Divider(),
            Space(space: context.responsive.screenHeight * 0.02),
            for (int i = 0; i < sideBarListItem.length; i++)
              Column(
                children: [
                  SideBarItem(
                      onTap: () => onItemSelected(i),
                      model: sideBarListItem[i],
                      isSelectedItem:currentIndex==i
                  ),
                  Space(space: context.responsive.screenHeight * 0.01),
                ],
              )
          ],
        ),
      ),
    );
  }
}

class SideBarItemModel {
  String title;
  String icon;

  SideBarItemModel({required this.title, required this.icon});
}

List<SideBarItemModel> sideBarListItem = [
  SideBarItemModel(title: 'لوحة التحكم', icon: SvgIcons.dashboard),
  SideBarItemModel(title: 'التصنيفات', icon: SvgIcons.folder),
  SideBarItemModel(title: 'القصص', icon: SvgIcons.book),
  SideBarItemModel(title: 'الاعدادات', icon: SvgIcons.settings),
];
