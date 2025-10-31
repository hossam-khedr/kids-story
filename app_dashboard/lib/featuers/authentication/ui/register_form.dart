import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

import '../../../core/dashboard_color.dart';
import '../../../core/svg_icon.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/custom_ritch_text.dart';
import '../../../core/widgets/custom_text_form.dart';

class RegisterForm extends StatelessWidget {
  final VoidCallback onLoginTap;
  const RegisterForm({super.key, required this.onLoginTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ResponsiveHelper.r.paddingAll(20),
      child: Column(
        spacing: ResponsiveHelper.r.height(1),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: AppText(
              data: 'إنشاء حساب جديد',
              style: TextStyle(
                fontSize: ResponsiveHelper.r.font(16),
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Gap(ResponsiveHelper.r.height(4)),
          AppText(
            data: 'الاسم الكامل',
            style: TextStyle(
              fontSize: ResponsiveHelper.r.font(10),
              fontWeight: FontWeight.normal,
              color: DashboardColors.darkGray,
            ),
          ),
          CustomTextForm(
            hint: 'ادخل اسمك كامل',
            prefixIcon: SvgIcons.user,
            filled: true,
            fillColor: DashboardColors.whait,
            colorBorder: Colors.grey[300],
          ),
          Gap(ResponsiveHelper.r.height(2)),
          AppText(
            data: 'البريد الإلكتروني',
            style: TextStyle(
              fontSize: ResponsiveHelper.r.font(10),
              fontWeight: FontWeight.normal,
              color: DashboardColors.darkGray,
            ),
          ),
          CustomTextForm(
            hint: 'ادخل بريدك الالكتروني',
            prefixIcon: SvgIcons.email,
            filled: true,
            fillColor: DashboardColors.whait,
            colorBorder: Colors.grey[300],
          ),
          Gap(ResponsiveHelper.r.height(2)),
          AppText(
            data: 'كلمة المرور',
            style: TextStyle(
              fontSize: ResponsiveHelper.r.font(10),
              fontWeight: FontWeight.normal,
              color: DashboardColors.darkGray,
            ),
          ),
          CustomTextForm(
            hint: 'ادخل كلمة المرور',
            obscureText: true,
            prefixIcon: SvgIcons.lock,
            filled: true,
            fillColor: DashboardColors.whait,
            colorBorder: Colors.grey[300],
          ),
          Gap(ResponsiveHelper.r.height(2)),
          AppText(
            data: 'تأكيد كلمة المرور',
            style: TextStyle(
              fontSize: ResponsiveHelper.r.font(10),
              fontWeight: FontWeight.normal,
              color: DashboardColors.darkGray,
            ),
          ),
          CustomTextForm(
            hint: 'اعد ادخال كلمة المرور',
            obscureText: true,
            prefixIcon: SvgIcons.lock,
            filled: true,
            fillColor: DashboardColors.whait,
            colorBorder: Colors.grey[300],
          ),
          Gap(ResponsiveHelper.r.height(2)),
        const  AppButton(text: 'انشاء حساب'),
          Gap(ResponsiveHelper.r.height(2)),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: CustomRichText(
              onTap: onLoginTap,
              hint: 'لديك حساب بالفعل؟',
              action: 'تسجيل دخول',
            ),
          ),
        ],
      ),
    );
  }
}