import 'package:app_dashboard/featuers/stories/ui/logic/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/constants/app_colors.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/navigation_helper.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

import '../../../../app/di.dart';
import '../../../../core/app_routse.dart';
import '../../../../core/widgets/add_button.dart';
import 'category_item.dart';
import '../logic/controller/cubit.dart';
import '../logic/controller/states.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    context.read<CategoriesCubit>().fitchCategories();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<CategoriesCubit>(context),
      child: BlocBuilder<CategoriesCubit, CategoriesStates>(
        builder: (context, state) {
          if (state.isGetLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.isGetError) {
            return Center(child: AppText(data: state.errorMessage));
          }
          if (state.isGetSuccess|| state.isDeleteLoading || state.isDeleteError) {
            if (state.categories.isEmpty) {
              return Center(child: AppText(data: 'Categories Empty'));
            }
            return Padding(
              padding: ResponsiveHelper.r.paddingSymmetric(horizontal: 10),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          Gap(ResponsiveHelper.r.height(1)),
                      itemCount: state.categories.length,
                      itemBuilder: (context, index) {
                        return CategoryItem(
                          title: state.categories[index].name,
                          isSelected: selectedIndex == index,
                          onDelete: () {
                            context.read<CategoriesCubit>().deleteCategory(
                              categoryId: state.categories[index].id,
                            );
                          },
                          onTap: () {
                            setState(() {
                              selectedIndex = index;

                            });
                            context.read<StoriesCubit>().getStoryByCategory(
                              id: state.categories[index].id,
                            );
                          },
                        );
                      },
                    ),
                  ),
                  selectedIndex == null
                      ? SizedBox.shrink()
                      : Padding(
                          padding: ResponsiveHelper.r.paddingSymmetric(
                            //horizontal: 10,
                            vertical: 5,
                          ),
                          child: AddButton(
                            color: AppColors.secondary,
                            text: 'AddNewStory',
                            onTap: () => NavigationHelper.pushNamed(
                              context,
                              AppRoutes.addStory,
                              arguments:
                                  state.categories[selectedIndex ?? 0].id,
                            ),
                          ),
                        ),
                ],
              ),
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
