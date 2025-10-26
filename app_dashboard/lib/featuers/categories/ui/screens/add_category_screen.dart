import 'package:app_dashboard/core/app_routse.dart';
import 'package:app_dashboard/core/widgets/app_text_field.dart';
import 'package:app_dashboard/core/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/constants/app_colors.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/navigation_helper.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';
import 'package:shared/utils/toast_service.dart';

import '../../../../app/di.dart';
import '../logic/controller/cubit.dart';
import '../logic/controller/states.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: getIt<CategoriesCubit>(),
        child: BlocConsumer<CategoriesCubit, CategoriesStates>(
          listener: (context, state) {
            if (state.isCreateError) {
              ToastService.error(context, state.errorMessage);
            }
            if (state.isCreateSuccess) {
              ToastService.success(context, 'Category Created Successfully');
              NavigationHelper.pushNamedAndRemoveUntil(context, AppRoutes.home);
            }
          },
          builder: (context, state) {
            return Card(
              clipBehavior: Clip.antiAlias,
              color: AppColors.whit,
              child: Padding(
                padding: ResponsiveHelper.r.paddingAll(20),
                child: Column(
                  spacing: ResponsiveHelper.r.height(2),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox.shrink(),
                        AppBackButton(),
                      ],
                    ),
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
                    AppTextField(
                      controller: titleController,
                      hintText: 'Enter the name of the new category',
                    ),
                    Gap(ResponsiveHelper.r.height(2)),
                    AppText(
                      data: 'Image URL:',
                      style: TextStyle(color: AppColors.sidebar),
                    ),
                    AppTextField(
                      controller: imageUrlController,
                      hintText: 'http://www.example.com/image.png',
                    ),

                    Spacer(),
                    state.isCreateLoading
                        ? CircularProgressIndicator()
                        : InkWell(
                            onTap: () {
                              context
                                  .read<CategoriesCubit>()
                                  .createCategory(
                                    title: titleController.text,
                                    imageUrl: imageUrlController.text,
                                  );
                            },
                            child: Container(
                              padding: ResponsiveHelper.r.paddingAll(10),
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
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
