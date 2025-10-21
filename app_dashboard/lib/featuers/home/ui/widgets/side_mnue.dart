import 'package:app_dashboard/app/di.dart';
import 'package:app_dashboard/core/widgets/add_button.dart';
import 'package:app_dashboard/featuers/categories/ui/category_list.dart';
import 'package:app_dashboard/featuers/categories/ui/logic/controller/cubit.dart';
import 'package:app_dashboard/featuers/categories/ui/logic/controller/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/constants/app_colors.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';
import 'package:shared/utils/toast_service.dart';

import '../../../categories/ui/add_new_category.dart';

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
            CategoryList(),
            BlocProvider.value(
              value: getIt<CategoriesCubit>(),
              child: Padding(
                padding: ResponsiveHelper.r.paddingAll(10),
                child: AddButton(
                  text: 'AddCategory',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AddNewCategory(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
