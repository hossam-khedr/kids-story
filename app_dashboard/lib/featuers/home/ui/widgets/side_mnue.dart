import 'package:app_dashboard/core/app_routse.dart';
import 'package:app_dashboard/core/widgets/add_button.dart';
import 'package:app_dashboard/featuers/categories/ui/widgets/category_list.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:shared/core/constants/app_colors.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/navigation_helper.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.whit,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: ResponsiveHelper.r.paddingSymmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: ResponsiveHelper.r.width(0.2),
                children: [
                  Icon(Icons.book, color: AppColors.primary),
                  AppText(
                    data: 'StoryTime',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.r.font(10),
                      fontWeight: FontWeight.bold,
                      color: AppColors.sidebar,
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: AppColors.darkGray),
            Padding(
              padding: ResponsiveHelper.r.paddingAll(10),
              child: AppText(
                data: 'Categories',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.sidebar,
                ),
              ),
            ),
            Expanded(child: CategoryList()),


            Padding(
              padding: ResponsiveHelper.r.paddingSymmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: AddButton(
                text: 'AddCategory',
                onTap: () {
                  NavigationHelper.pushNamed(context, AppRoutes.addCategory);
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
