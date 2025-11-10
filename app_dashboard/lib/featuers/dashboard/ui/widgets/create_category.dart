import 'dart:typed_data';

import 'package:app_dashboard/app/responsive_helper.dart';
import 'package:app_dashboard/core/dashboard_color.dart';
import 'package:app_dashboard/core/requestes/category_request.dart';
import 'package:app_dashboard/core/space_widget.dart';
import 'package:app_dashboard/core/widgets/app_button.dart';
import 'package:app_dashboard/core/widgets/custom_circle_progress.dart';
import 'package:app_dashboard/core/widgets/custom_text_form.dart';
import 'package:app_dashboard/featuers/dashboard/ui/logic/controller/cubit.dart';
import 'package:app_dashboard/featuers/dashboard/ui/logic/controller/stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/navigation_helper.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';
import 'package:shared/utils/toast_service.dart';

class CreateCategory extends StatefulWidget {
  const CreateCategory({super.key});

  @override
  State<CreateCategory> createState() => _CreateCategoryState();
}

class _CreateCategoryState extends State<CreateCategory> {
  final nameController = TextEditingController();
  final descController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(
          horizontal: context.responsive.isMobile?100:150,
          vertical: 10
        ),
        backgroundColor: DashboardColors.whait,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal:context.responsive.spacingM ,
            vertical: context.responsive.spacingL,
          ),
          child: BlocProvider.value(
            value: BlocProvider.of<DashboardCubit>(context),
            child: BlocConsumer<DashboardCubit, DashboardStats>(
              listener: (context, state) {
                if (state.isCreateCategoryError) {
                  ToastService.error(context, state.errorMessage);
                }
                if (state.isCreateCategorySuccess) {
                  ToastService.success(
                    context,
                    'Category created successfully',
                  );
                }
                if (state.isSelectedFileError) {
                  ToastService.error(context, state.errorMessage);
                }
                if (state.isSelectedFileSuccess) {
                  ToastService.success(context, 'Selected file success');
                }
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      data: 'إضافة تصنيف جديد',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Space(space: context.responsive.screenHeight * 0.05),
                    const Divider(height: 0.1),
                    Space(space: context.responsive.screenHeight * 0.05),
                    AppText(
                      data: 'اسم التصنيف',
                      style: TextStyle(fontSize: context.responsive.fontSize(8)),
                    ),
                    Space(space: context.responsive.screenHeight * 0.02),
                    CustomTextForm(
                      controller: nameController,
                      hint: 'ادخل اسم التصنيف',
                      filled: true,
                      fillColor: DashboardColors.whait,
                      colorBorder: Colors.grey[300],
                    ),
                    Space(space: context.responsive.screenHeight * 0.05),
                    AppText(
                      data: 'وصف التصنيف',
                      style: TextStyle(fontSize: context.responsive.fontSize(8)),
                    ),
                    Space(space: context.responsive.screenHeight * 0.02),
                    CustomTextForm(
                      controller: descController,
                      hint: 'وصف مختصر عن التصنيف',
                      filled: true,
                      fillColor: DashboardColors.whait,
                      maxLines: 4,
                      colorBorder: Colors.grey[300],
                    ),
                    Space(space: context.responsive.screenHeight * 0.05),
                    AppText(
                      data: 'رابط الصوره',
                      style: TextStyle(fontSize: context.responsive.fontSize(8)),
                    ),
                    Space(space: context.responsive.screenHeight * 0.02),
                    CustomTextForm(
                      readOnly: true,
                      onTap: () {
                        context.read<DashboardCubit>().pickImage();
                      },
                      hint: state.file != null
                          ? state.file!.path.split(' ').first
                          : 'http://www.exampl.com',
                      filled: true,
                      fillColor: DashboardColors.whait,
                      colorBorder: Colors.grey[300],
                    ),
                    Space(space: context.responsive.screenHeight * 0.05),
                    const Divider(height: 0.1),
                    Space(space: context.responsive.screenHeight * 0.05),
                    Row(
                      spacing:  context.responsive.screenHeight * 0.02,
                      children: [
                        state.isCreateCategoryLoading
                            ? const Center(
                                child: CustomCircleProgress(
                                  color: DashboardColors.pink,
                                ),
                              )
                            : Expanded(
                                child: AppButton(
                                  text: 'حفظ التصنيف',
                                  textFontSize: 8,
                                  onPressed: () {
                                    context
                                        .read<DashboardCubit>()
                                        .createCategory(
                                      request: CategoryRequest(
                                          name: nameController.text,
                                          description: descController.text,
                                          file: state.file!),

                                         // file: state.file!,
                                        );
                                  },
                                ),
                              ),
                        Expanded(
                          child: AppButton(
                            onPressed: () => NavigationHelper.pop(context),
                            text: 'الغاء',
                            color: DashboardColors.backgroundColor,
                            textColor: DashboardColors.darkGray,
                            textFontSize: 8,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
