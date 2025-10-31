import 'package:app_dashboard/core/dashboard_color.dart';
import 'package:app_dashboard/core/svg_icon.dart';
import 'package:app_dashboard/core/widgets/app_button.dart';
import 'package:app_dashboard/core/widgets/custom_ritch_text.dart';
import 'package:app_dashboard/core/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

class LoginForm extends StatelessWidget {
  final VoidCallback createAccount;
  final VoidCallback forgotTap;

  const LoginForm({
    super.key,
    required this.createAccount,
    required this.forgotTap,
  });

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
              data: 'تسجيل الدخول',
              style: TextStyle(
                fontSize: ResponsiveHelper.r.font(16),
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Gap(ResponsiveHelper.r.height(4)),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    activeColor: Colors.pink,
                    value: false,
                    side: BorderSide(color: Colors.grey[400]!),
                    onChanged: (v) {},
                  ),
                  AppText(data: 'تذكرني'),
                ],
              ),
              TextButton(
                onPressed: forgotTap,
                child: AppText(
                  data: 'نسيت كلمة المرور؟',
                  style: TextStyle(color: DashboardColors.pink),
                ),
              ),
            ],
          ),
          Gap(ResponsiveHelper.r.height(2)),
          AppButton(text: 'تسجيل الدخول'),
          Gap(ResponsiveHelper.r.height(2)),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: CustomRichText(
              onTap: createAccount,
              hint: 'ليس لديك حساب؟ ',
              action: 'انشاء حساب جديد',
            ),
          ),
        ],
      ),
    );
  }
}
