import 'package:app_dashboard/featuers/authentication/ui/widgets/back_to_login.dart';
import 'package:app_dashboard/featuers/authentication/ui/widgets/safety_tips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

import '../../../core/dashboard_color.dart';
import '../../../core/svg_icon.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/custom_text_form.dart';

class ResetForm extends StatelessWidget {
  final VoidCallback onLoginTap;
  final VoidCallback onForgotTap;

  const ResetForm({
    super.key,
    required this.onLoginTap,
    required this.onForgotTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ResponsiveHelper.r.paddingAll(20),
      child: Column(
        spacing: ResponsiveHelper.r.height(1),
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: DashboardColors.blue.withAlpha(50),
            child: SvgPicture.asset(SvgIcons.key, color: DashboardColors.blue),
          ),
          AppText(
            data: 'تغيير كلمة المرور',
            style: TextStyle(
              fontSize: ResponsiveHelper.r.font(16),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          AppText(
            data: 'قم بتحديث كلمة مرورك لحماية حسابك بشكل أفضل',
            style: TextStyle(
              fontSize: ResponsiveHelper.r.font(10),
              fontWeight: FontWeight.normal,
              color: Colors.grey[400],
            ),
          ),
          Gap(ResponsiveHelper.r.height(4)),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: AppText(
              data: 'كلمة المرور الجديدة',
              style: TextStyle(
                fontSize: ResponsiveHelper.r.font(10),
                fontWeight: FontWeight.normal,
                color: DashboardColors.darkGray,
              ),
            ),
          ),
          CustomTextForm(
            hint: 'ادخل كلمة المرور الجديده',
            obscureText: true,
            prefixIcon: SvgIcons.lock,
            filled: true,
            fillColor: DashboardColors.whait,
            colorBorder: Colors.grey[300],
          ),
          Gap(ResponsiveHelper.r.height(2)),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: AppText(
              data: 'تأكيد كلمة المرور الجديدة',
              style: TextStyle(
                fontSize: ResponsiveHelper.r.font(10),
                fontWeight: FontWeight.normal,
                color: DashboardColors.darkGray,
              ),
            ),
          ),
          CustomTextForm(
            hint: 'اعد ادخال كلمة المرور الجديده',
            obscureText: true,
            prefixIcon: SvgIcons.lock,
            filled: true,
            fillColor: DashboardColors.whait,
            colorBorder: Colors.grey[300],
          ),
          Gap(ResponsiveHelper.r.height(2)),
          const SafetyTips(),
          Gap(ResponsiveHelper.r.height(2)),
          const AppButton(text: 'تحديث كلمة المرور'),
          Gap(ResponsiveHelper.r.height(2)),
          BackToLogin(onPressed: onLoginTap),
          TextButton(
            onPressed: onForgotTap,
            child: const AppText(
              data: 'نسيت كلمة المرور الحالية؟',
              style: TextStyle(color: DashboardColors.pink),
            ),
          ),
        ],
      ),
    );
  }
}
