
import 'package:app_mobile/features/home/ui/widgets/category_item.dart';
import 'package:app_mobile/features/home/ui/widgets/home_app_bar.dart';
import 'package:app_mobile/features/home/ui/widgets/story_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/constants/app_colors.dart';
import 'package:shared/core/constants/app_strings.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/navigation_helper.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

import '../../../config/routes/app_routes.dart';
import 'logic/controller/home_cubit.dart';
import 'logic/controller/home_states.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        HomeAppBar(),
        SliverPadding(
          padding: ResponsiveHelper.r.paddingSymmetric(horizontal: 10),
          sliver: SliverToBoxAdapter(
            child: AppText(
              data: AppStrings.categories.tr(),
              style: TextStyle(
                color: AppColors.foreground,
                fontSize: ResponsiveHelper.r.font(24),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: ResponsiveHelper.r.paddingSymmetric(horizontal: 10),
          sliver: SliverToBoxAdapter(
            child: BlocBuilder<HomeCubit, HomeStates>(
              builder: (context, state) {
                if (state.isGetCategoriseError) {
                  return Center(child: Text(state.errorMessage));
                }
                if (state.isGetCategoriseLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state.isGetCategoriseSuccess ||
                    state.ischangeCategoryTap ||
                    state.isGetStoriesSuccess ||
                    state.isGetStoriesLoading ||
                    state.isGetStoriesError) {
                  return SizedBox(
                    height: ResponsiveHelper.r.height(15),
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          Gap(ResponsiveHelper.r.width(3)),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.categories.length,
                      itemBuilder: (context, index) {
                        return CategoryItem(
                          title: state.categories[index].name,
                          image: state.categories[index].image,
                          onTap: () {
                            context.read<HomeCubit>().changeCategoryTap(index);
                            context.read<HomeCubit>().getStoriesByCategoryID(
                              state.categories[index].id,
                            );
                          },
                          isSelected: state.categoryIndex == index,
                          currentIndex: index,
                        );
                      },
                    ),
                  );
                } else {
                  return Icon(Icons.error);
                }
              },
            ),
          ),
        ),
        SliverPadding(
          padding: ResponsiveHelper.r.paddingSymmetric(
            horizontal: 10,
            vertical: 10,
          ),
          sliver: BlocBuilder<HomeCubit, HomeStates>(
            builder: (context, state) {
              if (state.isGetStoriesError) {
                return SliverToBoxAdapter(
                  child: Center(child: AppText(data: state.errorMessage)),
                );
              }
              if (state.isGetStoriesLoading) {
                return SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              if (state.isGetStoriesSuccess) {
                if (state.stories.isEmpty) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: AppText(data: 'No Stories in this Category'),
                    ),
                  );
                }
                return SliverList.separated(
                  separatorBuilder: (context, index) => Gap(10),
                  itemCount: state.stories.length,
                  itemBuilder: (context, index) {
                    return StoryItem(
                      storyResponse: state.stories[index],
                      onTap: () {
                        NavigationHelper.pushNamed(
                          context,
                          AppRoutes.storyDetails,
                          arguments: state.stories[index].id,
                        );
                      },
                    );
                  },
                );
              } else {
                return SliverToBoxAdapter(child: AppText(data: 'No Data'));
              }
            },
          ),
        ),
      ],
    );
  }
}
