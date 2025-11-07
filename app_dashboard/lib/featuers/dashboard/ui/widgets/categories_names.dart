import 'package:app_dashboard/core/widgets/custom_circle_progress.dart';
import 'package:app_dashboard/core/responses/categories_names_response.dart';
import 'package:app_dashboard/featuers/dashboard/ui/logic/controller/cubit.dart';
import 'package:app_dashboard/featuers/dashboard/ui/logic/controller/stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

import '../../../../core/dashboard_color.dart';

class CategoriesNames extends StatefulWidget {
  const CategoriesNames({super.key});

  @override
  State<CategoriesNames> createState() => _CategoriesNamesState();
}

class _CategoriesNamesState extends State<CategoriesNames> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardCubit>().getCategoriesNames();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardStats>(
      builder: (context, state) {
        if (state.isGetNamesLoading) {
          return const Center(child: CustomCircleProgress());
        }
        if (state.isGetNamesError) {
          return Center(child: AppText(data: state.errorMessage));
        }
        if (state.isGetNamesSuccess ||
            state.isSelectedCategory ||
            state.isSelectedFileSuccess ||
            state.isCreateStoryLoading ||
            state.isCreateStoryError ||
            state.isCreateStorySuccess) {
          return DropdownMenu<CategoriesNamesResponse>(
            menuStyle: MenuStyle(
              backgroundColor: const WidgetStatePropertyAll(
                DashboardColors.whait,
              ),
              maximumSize: WidgetStatePropertyAll(
                Size(
                  ResponsiveHelper.r.width(45),
                  ResponsiveHelper.r.height(30),
                ),
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            textStyle: TextStyle(
              color: DashboardColors.darkGray,
              fontSize: ResponsiveHelper.r.font(8),
            ),
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  color: DashboardColors.lightPink,
                  width: 2,
                ),
              ),
            ),
            hintText: 'اختر تصنيف',
            width: ResponsiveHelper.r.width(45),
            enableFilter: true,
            onSelected: (value) {
              context.read<DashboardCubit>().onCategorySelected(value!);
            },
            dropdownMenuEntries: state.namesResponse
                .map(
                  (item) => DropdownMenuEntry(
                    value: item,
                    label: item.name,
                    labelWidget: AppText(
                      data: item.name,
                      style: TextStyle(fontSize: ResponsiveHelper.r.font(8)),
                    ),
                  ),
                )
                .toList(),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
