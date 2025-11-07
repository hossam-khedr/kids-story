import 'package:app_dashboard/core/widgets/custom_circle_progress.dart';
import 'package:app_dashboard/featuers/stories/ui/logic/controller/cubit.dart';
import 'package:app_dashboard/featuers/stories/ui/logic/controller/stats.dart';
import 'package:app_dashboard/featuers/stories/ui/widgets/story_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

import '../../../core/dashboard_color.dart';
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
    return BlocProvider.value(
      value:context.read<StoriesCubit>() ,
      child: BlocBuilder<StoriesCubit,StoriesStats>(
        builder: (context,state){
          if(state.isLoading){
            return const Center(child: CustomCircleProgress(color: DashboardColors.pink,),);
          }
          if(state.isError){
            return Center(child: AppText(data: state.errorMessage),);
          }
          if(state.isSuccess){
            return Padding(
              padding: ResponsiveHelper.r.paddingAll(14),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        spacing: ResponsiveHelper.r.height(1),
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            data: 'إدارة القصص',
                            style: TextStyle(
                              fontSize: ResponsiveHelper.r.font(14),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          AppText(
                            data: 'عرض وإدارة جميع القصص المنشورة',
                            style: TextStyle(
                              fontSize: ResponsiveHelper.r.font(8),
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
                        width: ResponsiveHelper.r.width(14),
                        textFontSize: ResponsiveHelper.r.font(6),
                      ),
                    ],
                  ),
                  Gap(ResponsiveHelper.r.height(6)),
                  Expanded(
                    child: GridView.builder(
                      itemCount: state.response!.stories.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.79,
                      ),
                      itemBuilder: (context, index) {
                        return  StoryItem(
                          story: state.response!.stories[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }else{
            return const SizedBox.shrink();
          }
        },

      ),
    );
  }
}
