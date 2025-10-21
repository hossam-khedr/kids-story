import 'package:app_dashboard/app/di.dart';
import 'package:app_dashboard/featuers/categories/ui/logic/controller/cubit.dart';
import 'package:app_dashboard/featuers/categories/ui/logic/controller/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/constants/app_colors.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/navigation_helper.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';
import 'package:shared/utils/toast_service.dart';

class AddNewCategory extends StatefulWidget {

  const AddNewCategory({super.key});

  @override
  State<AddNewCategory> createState() => _AddNewCategoryState();
}

class _AddNewCategoryState extends State<AddNewCategory> {
  TextEditingController titleController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: ResponsiveHelper.r.paddingSymmetric(
        horizontal: 80,
        vertical: 30,
      ),
      child: BlocProvider.value(value: getIt<CategoriesCubit>(),
        child: BlocConsumer<CategoriesCubit, CategoriesStates>(
          listener: (context, state) {
            if (state.isCreateError) {
              ToastService.error(context, state.errorMessage);
            }
            if (state.isCreateSuccess) {
              ToastService.success(context, 'Category Created Successfully');
            }
          },
          builder: (context, state) {
            return Card(
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
                      controller: titleController,
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
                      controller: imageUrlController,
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
                        state.isCreateLoading
                            ? CircularProgressIndicator()
                            : InkWell(
                          onTap: () {
                            context.read<CategoriesCubit>().createCategory(
                              title: titleController.text,
                              imageUrl: imageUrlController.text,
                            );
                          },
                          child: Container(
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
            );
          },
        ),
      )
    );
  }
}
