import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

import '../../../app/di.dart';
import 'category_item.dart';
import 'logic/controller/cubit.dart';
import 'logic/controller/states.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocProvider.value(
        value: getIt<CategoriesCubit>()..fitchCategories(),
        child: BlocBuilder<CategoriesCubit, CategoriesStates>(

          builder: (context, state) {

            if (state.isGetLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state.isGetError) {
              return Center(child: AppText(data: state.errorMessage));
            }
            if (state.isGetSuccess) {
              if(state.categories.isEmpty){
                return Center(child: AppText(data: 'Categories Empty'),);
              }
              return Padding(
                padding: ResponsiveHelper.r.paddingSymmetric(
                  horizontal: 10,
                ),
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
                      },
                    );
                  },
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
