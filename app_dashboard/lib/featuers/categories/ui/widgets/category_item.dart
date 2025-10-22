import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/core/constants/app_colors.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';
import 'package:shared/utils/toast_service.dart';

import '../logic/controller/cubit.dart';
import '../logic/controller/states.dart';

class CategoryItem extends StatelessWidget {
  final bool isSelected;
  final String title;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const CategoryItem({
    super.key,
    required this.isSelected,
    required this.title,
    this.onTap,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppColors.primary : AppColors.sidebar;
    final containerColor = isSelected
        ? AppColors.primary.withAlpha(50)
        : Colors.transparent;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: ResponsiveHelper.r.paddingAll(10),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              data: title,
              style: TextStyle(color: color),
            ),
            Row(
              spacing: ResponsiveHelper.r.width(0.2),
              children: [
                IconButton(
                  onPressed: onEdit,
                  icon: Icon(Icons.edit, color: color),
                ),
                BlocConsumer<CategoriesCubit, CategoriesStates>(
                  listener: (context, state) {
                    if (state.isDeleteSuccess) {
                      ToastService.success(
                        context,
                        'Category Deleted Successfully',
                      );
                    }
                    if (state.isDeleteError) {
                      ToastService.error(context, state.errorMessage);
                    }
                  },
                  builder: (context, state) {
                    return IconButton(
                      onPressed: onDelete,
                      icon: state.isDeleteLoading
                          ? CircularProgressIndicator()
                          : Icon(Icons.delete_forever_outlined, color: color),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}