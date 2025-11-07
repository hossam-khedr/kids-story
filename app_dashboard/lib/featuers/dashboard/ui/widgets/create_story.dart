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
        insetPadding: ResponsiveHelper.r.paddingSymmetric(
          horizontal: 220,
          vertical: 10,
        ),
        backgroundColor: DashboardColors.whait,
        child: Padding(
          padding: ResponsiveHelper.r.paddingSymmetric(
            horizontal: 14,
            vertical: 16,
          ),
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
                      Gap(ResponsiveHelper.r.height(5)),
                      const Divider(height: 0.1),
                      Space(space: ResponsiveHelper.r.height(5)),
                      AppText(
                        data: 'عنوان القصه',
                        style: TextStyle(fontSize: ResponsiveHelper.r.font(8)),
                      ),
                      Space(space: ResponsiveHelper.r.height(2)),
                      CustomTextForm(
                        controller: nameController,
                        hint: 'ادخل عنوان القصه',
                        filled: true,
                        fillColor: DashboardColors.whait,
                        colorBorder: Colors.grey[300],
                      ),
                      Space(space: ResponsiveHelper.r.height(5)),
                      AppText(
                        data: 'العمر من و الي',
                        style: TextStyle(fontSize: ResponsiveHelper.r.font(8)),
                      ),
                      Space(space: ResponsiveHelper.r.height(2)),
                      Row(
                        spacing: ResponsiveHelper.r.width(3),
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
                      Space(space: ResponsiveHelper.r.height(5)),
                      AppText(
                        data: 'رابط الصوره',
                        style: TextStyle(fontSize: ResponsiveHelper.r.font(8)),
                      ),
                      Space(space: ResponsiveHelper.r.height(2)),
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
                      Space(space: ResponsiveHelper.r.height(5)),
                      AppText(
                        data: 'التصنيف',
                        style: TextStyle(fontSize: ResponsiveHelper.r.font(8)),
                      ),
                      Space(space: ResponsiveHelper.r.height(2)),
                      const CategoriesNames(),
                      Space(space: ResponsiveHelper.r.height(5)),
                      AppText(
                        data: 'محتوى القصة',
                        style: TextStyle(fontSize: ResponsiveHelper.r.font(8)),
                      ),
                      Space(space: ResponsiveHelper.r.height(2)),
                      CustomTextForm(
                        controller: contentController,
                        hint: 'اكتب محتوي القصه هنا',
                        filled: true,
                        fillColor: DashboardColors.whait,
                        colorBorder: Colors.grey[300],
                        maxLines: 12,
                      ),
                      Space(space: ResponsiveHelper.r.height(5)),
                      const Divider(height: 0.1),
                      Space(space: ResponsiveHelper.r.height(5)),
                      Row(
                        spacing: ResponsiveHelper.r.width(2),
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
