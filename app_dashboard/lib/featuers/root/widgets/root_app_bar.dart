import 'package:app_dashboard/core/dashboard_color.dart';
import 'package:app_dashboard/featuers/home/ui/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

class RootAppBar extends StatelessWidget {
  const RootAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: DashboardColors.whait,
      margin: EdgeInsets.zero,
      elevation: 0.5,
      child: Container(
        color: Colors.white,
        width: double.infinity,
        height: ResponsiveHelper.r.height(12),
        padding: ResponsiveHelper.r.paddingSymmetric(horizontal: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: DashboardColors.whait,
              width: ResponsiveHelper.r.width(25),
              child: const CustomSearchBar(),
            ),
            Row(
              spacing: ResponsiveHelper.r.width(1),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppText(
                      data: 'Hossam Khedr',
                      style: TextStyle(
                        color: DashboardColors.darkGray,
                        fontSize: ResponsiveHelper.r.font(8),
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    AppText(data: 'مدير التطبيق',style: TextStyle(
                        color: DashboardColors.darkGray,
                        fontSize: ResponsiveHelper.r.font(8),
                        fontWeight: FontWeight.normal
                    ),),
                  ],
                ),
                const CircleAvatar(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
