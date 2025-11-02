import 'package:app_dashboard/core/dashboard_color.dart';
import 'package:app_dashboard/core/widgets/app_button.dart';
import 'package:app_dashboard/core/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/navigation_helper.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

class CreateCategory extends StatelessWidget {
  const CreateCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        insetPadding: ResponsiveHelper.r.paddingSymmetric(
          horizontal: 290,
          vertical: 15,
        ),
        backgroundColor: DashboardColors.whait,
        child: Padding(
          padding: ResponsiveHelper.r.paddingSymmetric(
            horizontal: 14,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppText(
                data: 'إضافة تصنيف جديد',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Gap(ResponsiveHelper.r.height(5)),
              const Divider(height: 0.1),
              Gap(ResponsiveHelper.r.height(5)),
              AppText(
                data: 'اسم التصنيف',
                style: TextStyle(fontSize: ResponsiveHelper.r.font(8)),
              ),
              Gap(ResponsiveHelper.r.height(2)),
              CustomTextForm(
                hint: 'ادخل اسم التصنيف',
                filled: true,
                fillColor: DashboardColors.whait,
                colorBorder: Colors.grey[300],
              ),
              Gap(ResponsiveHelper.r.height(5)),
              AppText(
                data: 'وصف التصنيف',
                style: TextStyle(fontSize: ResponsiveHelper.r.font(8)),
              ),
              Gap(ResponsiveHelper.r.height(2)),
              CustomTextForm(
                hint: 'وصف مختصر عن التصنيف',
                filled: true,
                fillColor: DashboardColors.whait,
                maxLines: 4,
                colorBorder: Colors.grey[300],
              ),
              Gap(ResponsiveHelper.r.height(5)),
              AppText(
                data: 'رابط الصوره',
                style: TextStyle(fontSize: ResponsiveHelper.r.font(8)),
              ),
              Gap(ResponsiveHelper.r.height(2)),
              CustomTextForm(
                hint: 'http://www.exampl.com',
                filled: true,
                fillColor: DashboardColors.whait,
                colorBorder: Colors.grey[300],
              ),
              Gap(ResponsiveHelper.r.height(5)),
              const Divider(height: 0.1),
              Gap(ResponsiveHelper.r.height(5)),
              Row(
                spacing: ResponsiveHelper.r.width(2),
                children: [
                  const Expanded(
                    child: AppButton(text: 'حفظ التصنيف', textFontSize: 8),
                  ),
                  Expanded(
                    child: AppButton(
                      onPressed: () => NavigationHelper.pop(context),
                      text: 'الغاء',
                      color: DashboardColors.backgroundColor,
                      textColor: DashboardColors.darkGray,
                      textFontSize: 8,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
