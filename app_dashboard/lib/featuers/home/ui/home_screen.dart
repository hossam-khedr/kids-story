import 'package:app_dashboard/core/strings.dart';
import 'package:app_dashboard/featuers/categories/ui/logic/controller/cubit.dart';
import 'package:app_dashboard/featuers/home/ui/widgets/search_bar.dart';
import 'package:app_dashboard/featuers/home/ui/widgets/side_mnue.dart';
import 'package:app_dashboard/featuers/home/ui/widgets/story_item.dart';
import 'package:app_dashboard/featuers/stories/ui/logic/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/core/constants/app_colors.dart';
import 'package:shared/core/constants/app_strings.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

import '../../stories/ui/logic/cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryState = context.watch<CategoriesCubit>().state;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Row(
          children: [
            SideMenu(),
            Expanded(
              flex: 4,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                margin: EdgeInsets.zero,
                color: AppColors.whit,
                child: Padding(
                  padding: ResponsiveHelper.r.paddingSymmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Column(
                    spacing: ResponsiveHelper.r.height(5),
                    children: [
                      // HomeAppBar(),
                      CustomSearchBar(),
                      Expanded(
                        child: BlocProvider.value(
                          value: BlocProvider.of<StoriesCubit>(context),
                          child: BlocBuilder<StoriesCubit, StoriesStates>(
                            builder: (context, state) {
                              if (state.isInit) {
                                return Center(
                                  child: AppText(data: DashboardStrings.selectCategory),
                                );
                              }
                              if (state.isGetLoading) {
                                return Center(child: CircularProgressIndicator());
                              }
                              if (state.isGetError) {
                                return Center(child: Text(state.errorMessage));
                              }
                              if (state.isGetSuccess ||
                                  state.isDeleteLoading ||
                                  state.isDeleteError ||
                                  state.isDeleteSuccess) {
                                if (state.stories.isEmpty) {
                                  return Center(child: Text(DashboardStrings.storyListEmpty));
                                }
                                return GridView.builder(
                                  itemCount: state.stories.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20,
                                        mainAxisExtent: 300,
                                      ),
                                  itemBuilder: (context, index) {
                                    return StoryItem(
                                      response: state.stories[index],
                                      onDelete: () async {
                                        final storyId = state.stories[index].id;
                                        final categoryId =
                                            categoryState.categories[index].id;

                                        await context
                                            .read<StoriesCubit>()
                                            .deleteStory(id: storyId);

                                        context
                                            .read<StoriesCubit>()
                                            .getStoryByCategory(id: categoryId);
                                      },
                                    );
                                  },
                                );
                              } else {
                                return SizedBox.shrink();
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
