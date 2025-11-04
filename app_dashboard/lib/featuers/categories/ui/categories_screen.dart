import 'package:app_dashboard/core/dashboard_color.dart';
import 'package:app_dashboard/core/svg_icon.dart';
import 'package:app_dashboard/core/widgets/app_button.dart';
import 'package:app_dashboard/core/widgets/custom_circle_progress.dart';
import 'package:app_dashboard/featuers/categories/ui/logic/controller/cubit.dart';
import 'package:app_dashboard/featuers/categories/ui/logic/controller/stats.dart';
import 'package:app_dashboard/featuers/categories/ui/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/core/widgets/custom_network_image.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CategoriesCubit>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ResponsiveHelper.r.paddingAll(14),
      child: BlocBuilder<CategoriesCubit, CategoriesStats>(
        builder: (context, stat) {
          if (stat.isLoading) {
            return  const Center(
              child: CustomCircleProgress(
                color: DashboardColors.pink,
                size: 40,

              ),
            );
          }
          if (stat.isError) {
            return Center(child: AppText(data: stat.errorMessage));
          }
          if (stat.isSuccess ||
              stat.isDeleteSuccess ||
              stat.isDeleteLoading ||
              stat.isDeleteError) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      spacing: ResponsiveHelper.r.height(1),
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          data: 'إدارة التصنيفات',
                          style: TextStyle(
                            fontSize: ResponsiveHelper.r.font(14),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        AppText(
                          data: 'تنظيم وإدارة تصنيفات القصص',
                          style: TextStyle(
                            fontSize: ResponsiveHelper.r.font(8),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    AppButton(
                      text: 'اضافة تصنيف',
                      icon: const Icon(
                        Icons.add,
                        color: DashboardColors.whait,
                        size: 20,
                      ),
                      width: ResponsiveHelper.r.width(13),
                      textFontSize: ResponsiveHelper.r.font(6),
                    ),
                  ],
                ),
                Gap(ResponsiveHelper.r.height(6)),
                Expanded(
                  child: GridView.builder(
                    itemCount: stat.data.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.84,
                        ),
                    itemBuilder: (context, index) {
                      return CategoryItem(
                        response: stat.data[index],
                        onDelete: () => context
                            .read<CategoriesCubit>()
                            .deleteCategory(id: stat.data[index].id),
                      );
                    },
                  ),
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
