import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/constants/app_colors.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/navigation_helper.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

class AddNewCategory extends StatelessWidget {
  const AddNewCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: ResponsiveHelper.r.paddingSymmetric(
        horizontal: 80,
        vertical: 30,
      ),
      child: Card(
        color: AppColors.whit,
        child: Padding(
          padding: ResponsiveHelper.r.paddingAll(20),
          child: Column(
            spacing: ResponsiveHelper.r.height(2),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                data: 'AddNew Category',
                style: TextStyle(
                  color: AppColors.sidebar,
                  fontWeight: FontWeight.bold,
                  fontSize: ResponsiveHelper.r.font(25),
                ),
              ),
              AppText(
                data: 'Category Name',
                style: TextStyle(color: AppColors.sidebar),
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 1.5,
                    ),
                  ),
                  hintText: 'Enter the name of the new category',
                  helperStyle: TextStyle(color: Colors.grey),
                ),
              ),
              Gap(ResponsiveHelper.r.height(2)),
              AppText(
                data: 'Image URL:',
                style: TextStyle(color: AppColors.sidebar),
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 1.5,
                    ),
                  ),
                  hintText: 'http://www.example.com/image.png',
                  helperStyle: TextStyle(color: Colors.grey),
                ),
              ),
              Spacer(),
              Row(
                spacing: ResponsiveHelper.r.width(2),
                children: [
                  Container(
                    padding: ResponsiveHelper.r.paddingAll(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.primary,
                    ),
                    child: AppText(
                      data: 'Add Category',
                      style: TextStyle(color: AppColors.whit),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      NavigationHelper.pop(context);
                    },
                    child: AppText(
                      data: 'Cancel',
                      style: TextStyle(
                        color: AppColors.sidebar,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
