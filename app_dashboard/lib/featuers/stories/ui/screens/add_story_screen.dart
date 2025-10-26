import 'package:app_dashboard/app/di.dart';
import 'package:app_dashboard/core/app_routse.dart';
import 'package:app_dashboard/core/widgets/app_text_field.dart';
import 'package:app_dashboard/core/widgets/back_button.dart';
import 'package:app_dashboard/featuers/stories/ui/logic/cubit.dart';
import 'package:app_dashboard/featuers/stories/ui/logic/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/constants/app_colors.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/dialog_servises.dart';
import 'package:shared/utils/helpers/navigation_helper.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';
import 'package:shared/utils/toast_service.dart';

class AddStoryScreen extends StatefulWidget {
  const AddStoryScreen({super.key});

  @override
  State<AddStoryScreen> createState() => _AddStoryScreenState();
}

class _AddStoryScreenState extends State<AddStoryScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final categoryId = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocListener<StoriesCubit, StoriesStates>(
          listener: (context, state) {
            if (state.isCreateLoading) {
              DialogService.showLoading(context);
            }
            if (state.isCreateError) {
              NavigationHelper.pop(context);
              ToastService.error(context, state.errorMessage);
            }
            if (state.isCreateSuccess) {
              NavigationHelper.pop(context);
              ToastService.success(context, 'Story Created Successfully');
              NavigationHelper.pushNamedAndRemoveUntil(context, AppRoutes.home);
            }
          },
          child: Card(
            color: AppColors.secondary.withAlpha(70),
            elevation: 0,
            child: Padding(
              padding: ResponsiveHelper.r.paddingSymmetric(
                horizontal: 80,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: ResponsiveHelper.r.height(2),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        data: 'AddaNewStory',
                        style: TextStyle(
                          height: 1.7,
                          fontWeight: FontWeight.bold,
                          fontSize: ResponsiveHelper.r.font(25),
                        ),
                      ),
                      const AppBackButton(),
                    ],
                  ),
                  Gap(ResponsiveHelper.r.height(5)),
                  AppText(
                    data: 'Story title',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: ResponsiveHelper.r.font(12),
                    ),
                  ),
                  AppTextField(
                    controller: titleController,
                    hintText: 'Enter the title of your story',
                    filled: true,
                    fillColor: AppColors.whit,
                  ),
                  AppText(
                    data: 'ImageURL:',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: ResponsiveHelper.r.font(12),
                    ),
                  ),
                  AppTextField(
                    controller: imageController,
                    hintText: 'http://www.example.com/png',
                    filled: true,
                    fillColor: AppColors.whit,
                  ),
                  AppText(
                    data: 'Description',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: ResponsiveHelper.r.font(12),
                    ),
                  ),
                  AppTextField(
                    controller: descController,
                    hintText: 'Enter the description of your story',
                    filled: true,
                    fillColor: AppColors.whit,
                    maxLines: 2,
                  ),
                  AppText(
                    data: 'Content',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: ResponsiveHelper.r.font(12),
                    ),
                  ),
                  AppTextField(
                    controller: contentController,
                    hintText: 'Start writing your story',
                    filled: true,
                    fillColor: AppColors.whit,
                    maxLines: 10,
                  ),
                  InkWell(
                    onTap: () {
                      context.read<StoriesCubit>().createStory(
                        title: titleController.text,
                        image: imageController.text,
                        desc: descController.text,
                        content: contentController.text,
                        id: categoryId,
                      );
                    },
                    child: Container(
                      padding: ResponsiveHelper.r.paddingAll(5),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: AppText(
                        data: 'Create Story',
                        style: TextStyle(
                          fontSize: ResponsiveHelper.r.font(14),
                          color: AppColors.whit,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
