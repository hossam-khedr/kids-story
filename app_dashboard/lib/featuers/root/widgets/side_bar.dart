import 'package:app_dashboard/core/dashboard_color.dart';
import 'package:app_dashboard/core/svg_icon.dart';
import 'package:app_dashboard/featuers/root/widgets/side_bar_item.dart';
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
        padding: ResponsiveHelper.r.paddingAll(20),
        child: Column(
          children: [
            Row(
              spacing: ResponsiveHelper.r.width(1),
              children: [
                const CircleAvatar(
                  backgroundColor: DashboardColors.pink,
                  child: Icon(
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
                        fontSize: ResponsiveHelper.r.font(12),
                      ),
                    ),
                    AppText(
                      data: 'قصص الأطفال',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: DashboardColors.darkGray,
                        fontSize: ResponsiveHelper.r.font(8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Gap(ResponsiveHelper.r.height(4)),
            const Divider(),
            Gap(ResponsiveHelper.r.height(2)),
            for (int i = 0; i < sideBarListItem.length; i++)
              Column(
                children: [
                  SideBarItem(
                      onTap: () => onItemSelected(i),
                      model: sideBarListItem[i],
                      isSelectedItem:currentIndex==i
                  ),
                  Gap(ResponsiveHelper.r.height(1))
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
