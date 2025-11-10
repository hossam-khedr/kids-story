import 'package:app_dashboard/app/responsive_helper.dart';
import 'package:app_dashboard/core/requestes/story_request.dart';
import 'package:app_dashboard/core/space_widget.dart';
import 'package:app_dashboard/core/widgets/custom_circle_progress.dart';
import 'package:app_dashboard/featuers/dashboard/ui/logic/controller/cubit.dart';
import 'package:app_dashboard/featuers/dashboard/ui/logic/controller/stats.dart';
import 'package:app_dashboard/featuers/dashboard/ui/widgets/categories_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/navigation_helper.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';
import 'package:shared/utils/toast_service.dart';

import '../../../../core/dashboard_color.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/custom_text_form.dart';

class CreateStory extends StatefulWidget {
  const CreateStory({super.key});

  @override
  State<CreateStory> createState() => _CreateStoryState();
}

class _CreateStoryState extends State<CreateStory> {
  final nameController = TextEditingController();
  final ageMinController = TextEditingController();
  final ageMaxController = TextEditingController();
  final contentController = TextEditingController();

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
          padding: EdgeInsets.all(context.responsive.spacingM),
          child: SingleChildScrollView(
            child: BlocProvider.value(
              value: context.read<DashboardCubit>(),
              child: BlocConsumer<DashboardCubit, DashboardStats>(
                listener: (context, state) {
                  if (state.isCreateStorySuccess) {
                    ToastService.success(context, 'Story created successfully');
                  }
                },
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                        data: 'إضافة قصة جديد',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Space(space: context.responsive.screenHeight * 0.05),
                      const Divider(height: 0.1),
                      Space(space: context.responsive.screenHeight * 0.05),
                      AppText(
                        data: 'عنوان القصه',
                        style: TextStyle(fontSize: context.responsive.fontSize(8)),
                      ),
                      Space(space: context.responsive.screenHeight * 0.02),
                      CustomTextForm(
                        controller: nameController,
                        hint: 'ادخل عنوان القصه',
                        filled: true,
                        fillColor: DashboardColors.whait,
                        colorBorder: Colors.grey[300],
                      ),
                      Space(space: context.responsive.screenHeight * 0.05),
                      AppText(
                        data: 'العمر من و الي',
                        style: TextStyle(fontSize: context.responsive.fontSize(8)),
                      ),
                      Space(space: context.responsive.screenHeight * 0.02),
                      Row(
                        spacing: context.responsive.screenWidth * 0.03,
                        children: [
                          Expanded(
                            child: CustomTextForm(
                              controller: ageMinController,
                              hint: 'من عمر',
                              filled: true,
                              fillColor: DashboardColors.whait,
                              colorBorder: Colors.grey[300],
                            ),
                          ),
                          Expanded(
                            child: CustomTextForm(
                              controller: ageMaxController,
                              hint: 'الي عمر',
                              filled: true,
                              fillColor: DashboardColors.whait,
                              colorBorder: Colors.grey[300],
                            ),
                          ),
                        ],
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
                      AppText(
                        data: 'التصنيف',
                        style: TextStyle(fontSize: context.responsive.fontSize(8)),
                      ),
                      Space(space: context.responsive.screenHeight * 0.02),
                      const CategoriesNames(),
                      Space(space: context.responsive.screenHeight * 0.05),
                      AppText(
                        data: 'محتوى القصة',
                        style: TextStyle(fontSize: context.responsive.fontSize(8)),
                      ),
                      Space(space: context.responsive.screenHeight * 0.02),
                      CustomTextForm(
                        controller: contentController,
                        hint: 'اكتب محتوي القصه هنا',
                        filled: true,
                        fillColor: DashboardColors.whait,
                        colorBorder: Colors.grey[300],
                        maxLines: 12,
                      ),
                      Space(space: context.responsive.screenHeight * 0.05),
                      const Divider(height: 0.1),
                      Space(space: context.responsive.screenHeight * 0.05),
                      Row(
                        spacing: context.responsive.screenWidth * 0.02,
                        children: [
                          state.isCreateStoryLoading
                              ? const Center(
                                  child: CustomCircleProgress(
                                    color: DashboardColors.pink,
                                  ),
                                )
                              : Expanded(
                                  child: AppButton(
                                    text: 'حفظ القصه',
                                    textFontSize: 8,
                                    onPressed: () {
                                      context
                                          .read<DashboardCubit>()
                                          .createStory(
                                            request: StoryRequest(
                                              title: nameController.text,
                                              content: contentController.text,
                                              categoryName:
                                                  state.selectedCategory ?? '',
                                              ageMin: int.parse(
                                                ageMinController.text,
                                              ),
                                              ageMax: int.parse(
                                                ageMaxController.text,
                                              ),
                                              isActive: true,
                                              file: state.file!,
                                            ),
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
      ),
    );
  }
}
