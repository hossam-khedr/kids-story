import 'package:app_dashboard/app/responsive_helper.dart';
import 'package:app_dashboard/core/widgets/custom_circle_progress.dart';
import 'package:app_dashboard/featuers/categories/ui/logic/controller/cubit.dart';
import 'package:app_dashboard/featuers/categories/ui/logic/controller/stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared/core/constants/api_constants.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/core/widgets/custom_network_image.dart';
import 'package:shared/responses/category_response.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';
import 'package:shared/utils/toast_service.dart';

import '../../../../core/dashboard_color.dart';
import '../../../../core/svg_icon.dart';

class CategoryItem extends StatelessWidget {
  final CategoryResponse response;
  final void Function()? onDelete;

  const CategoryItem({super.key, required this.response, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: DashboardColors.whait,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(30),
      ),
      child: Padding(
        padding: EdgeInsets.all(context.responsive.spacingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: context.responsive.screenHeight * 0.02,
          children: [
            CustomNetworkImage(
              src: ('${ApiConstants.baseUrl}/${response.image}'),
              //response.image,
              height: context.responsive.screenHeight * 0.2,
              width: double.infinity,
              borderRadius: BorderRadius.circular(20),
            ),
            AppText(
              data: response.name,
              style: TextStyle(
                fontSize: context.responsive.isMobile?10:12,
                fontWeight: FontWeight.bold,
              ),
            ),
            AppText(
              data:
                  ' قصه'
                  '${response.storiesCount.toString()} ',
              style: TextStyle(
                fontSize: context.responsive.isMobile?10:12,
                fontWeight: FontWeight.w300,
              ),
            ),
            Row(
              spacing: context.responsive.screenWidth * 0.01,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(context.responsive.spacingS),
                    decoration: BoxDecoration(
                      color: Colors.blue.withAlpha(50),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(
                      SvgIcons.edit,
                      color: DashboardColors.blue,
                      height: context.responsive.screenHeight * 0.03,
                    ),
                  ),
                ),
                Expanded(
                  child: BlocConsumer<CategoriesCubit, CategoriesStats>(
                    listener: (context, state) {
                      if (state.isDeleteError) {
                        ToastService.error(context, state.errorMessage);
                      }
                      if (state.isDeleteSuccess) {
                        ToastService.success(
                          context,
                          'Category Deleted Successfully',
                        );
                      }
                    },
                    builder: (context, state) {
                      final isDeleting =
                          state.isDeleteLoading &&
                          state.deletingId == response.id;
                      return isDeleting
                          ? const CustomCircleProgress(color: DashboardColors.pink,)
                          : InkWell(
                              onTap: onDelete,
                              child: Container(
                                padding: EdgeInsets.all(context.responsive.spacingS),
                                decoration: BoxDecoration(
                                  color: Colors.red.withAlpha(50),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SvgPicture.asset(
                                  SvgIcons.delete,
                                  color: Colors.red,
                                  height: context.responsive.screenHeight * 0.03,
                                ),
                              ),
                            );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
