import 'package:app_dashboard/app/di.dart';
import 'package:app_dashboard/app/responsive_helper.dart';
import 'package:app_dashboard/core/widgets/custom_circle_progress.dart';
import 'package:app_dashboard/core/widgets/story_grid.dart';
import 'package:app_dashboard/featuers/dashboard/ui/logic/controller/cubit.dart';
import 'package:app_dashboard/featuers/dashboard/ui/widgets/create_story.dart';
import 'package:app_dashboard/featuers/stories/ui/logic/controller/cubit.dart';
import 'package:app_dashboard/featuers/stories/ui/logic/controller/stats.dart';
import 'package:app_dashboard/featuers/stories/ui/widgets/story_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

import '../../../core/dashboard_color.dart';
import '../../../core/space_widget.dart';
import '../../../core/widgets/app_button.dart';

class StoriesScreen extends StatefulWidget {
  const StoriesScreen({super.key});

  @override
  State<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<StoriesCubit>().getAllStories();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.responsive.spacingM),
      child: BlocBuilder<StoriesCubit, StoriesStats>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CustomCircleProgress(color: DashboardColors.pink),
            );
          }
          if (state.isError) {
            return Center(child: AppText(data: state.errorMessage));
          }
          if (state.isSuccess ||
              state.isDeleteLoading ||
              state.isDeleteError ||
              state.isDeleteSuccess) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      spacing: context.responsive.screenHeight * 0.02,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          data: 'إدارة القصص',
                          style: TextStyle(
                            fontSize: context.responsive.isMobile ? 12 : 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        AppText(
                          data: 'عرض وإدارة جميع القصص المنشورة',
                          style: TextStyle(
                            fontSize: context.responsive.isMobile ? 8 : 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    AppButton(
                      text: 'اضافة قصه جديده',
                      icon: const Icon(
                        Icons.add,
                        color: DashboardColors.whait,
                        size: 20,
                      ),
                      width: context.responsive.isMobile ? 130 : 170,
                      textFontSize: context.responsive.fontSize(6),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => BlocProvider.value(
                            value: getIt<DashboardCubit>(),
                            child: const CreateStory(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Space(space: context.responsive.screenHeight * 0.06),
                StoryGrid(
                  stats: state,
                  itemBuilder: (context, index) {
                    return StoryItem(
                      isDeleting:
                          state.isDeleteLoading &&
                          state.idDeleted == state.stories[index].id,
                      story: state.stories[index],
                      onDelete: () => context.read<StoriesCubit>().deleteStory(
                        id: state.stories[index].id,
                      ),
                    );
                  },
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
