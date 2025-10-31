import 'package:app_dashboard/core/dashboard_color.dart';
import 'package:app_dashboard/core/svg_icon.dart';
import 'package:app_dashboard/core/widgets/app_button.dart';
import 'package:app_dashboard/featuers/authentication/ui/widgets/back_to_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

import '../../../core/widgets/custom_text_form.dart';

class ForgotForm extends StatelessWidget {
  final VoidCallback onResetPasswordTap;
  final VoidCallback onLoginTap;

  const ForgotForm({
    super.key,
    required this.onResetPasswordTap,
    required this.onLoginTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ResponsiveHelper.r.paddingAll(20),
      child: Column(
        spacing: ResponsiveHelper.r.height(2),
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: DashboardColors.blue.withAlpha(50),
            child: SvgPicture.asset(SvgIcons.lock, color: DashboardColors.blue),
          ),
          AppText(
            data: 'نسيت كلمة المرور؟',
            style: TextStyle(
              fontSize: ResponsiveHelper.r.font(16),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          AppText(
            data:
                'لا تقلق، سنرسل لك رابط إعادة تعيين كلمة المرور على بريدك الإلكتروني',
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
              data: 'البريد الإلكتروني',
              style: TextStyle(
                fontSize: ResponsiveHelper.r.font(10),
                fontWeight: FontWeight.normal,
                color: DashboardColors.darkGray,
              ),
            ),
          ),
          CustomTextForm(
            hint: 'ادخل بريدك الالكتروني',
            prefixIcon: SvgIcons.email,
            filled: true,
            fillColor: DashboardColors.whait,
            colorBorder: Colors.grey[300],
          ),
          Gap(ResponsiveHelper.r.height(1)),
          AppButton(
            text: 'ارسال رابط الاستعاده',
            onPressed: onResetPasswordTap,
          ),
          Gap(ResponsiveHelper.r.height(1)),
          BackToLogin(onPressed: onLoginTap,)

        ],
      ),
    );
  }
}
