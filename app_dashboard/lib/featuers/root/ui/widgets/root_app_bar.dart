import 'package:app_dashboard/app/responsive_helper.dart';
import 'package:app_dashboard/core/dashboard_color.dart';
import 'package:flutter/material.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

import 'custom_search_bar.dart';

class RootAppBar extends StatelessWidget {
 final void Function(String)? onChanged;
 final TextEditingController? controller;
  const RootAppBar({super.key, this.onChanged, this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: DashboardColors.whait,
      margin: EdgeInsets.zero,
      elevation: 0.5,
      child: Container(
        color: Colors.white,
        width: double.infinity,
        height: context.responsive.screenHeight *0.12,
        padding: EdgeInsets.symmetric(
          horizontal: context.responsive.spacingM
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: DashboardColors.whait,
              width: context.responsive.screenWidth *0.25,
              child:  CustomSearchBar(onChanged:onChanged ,controller: controller,),
            ),
            Row(
              spacing:context.responsive.screenWidth *0.01,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppText(
                      data: 'Hossam Khedr',
                      style: TextStyle(
                        color: DashboardColors.darkGray,
                        fontSize: context.responsive.fontSize(8),
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    AppText(data: 'مدير التطبيق',style: TextStyle(
                        color: DashboardColors.darkGray,
                        fontSize: context.responsive.fontSize(8),
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
