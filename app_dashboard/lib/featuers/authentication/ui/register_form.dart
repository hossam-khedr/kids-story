import 'package:app_dashboard/featuers/authentication/ui/logic/controller/auth_admin_cubit.dart';
import 'package:app_dashboard/featuers/authentication/ui/logic/controller/auth_admin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/dialog_servises.dart';
import 'package:shared/utils/helpers/navigation_helper.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';
import 'package:shared/utils/toast_service.dart';

import '../../../core/app_routse.dart';
import '../../../core/dashboard_color.dart';
import '../../../core/svg_icon.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/custom_ritch_text.dart';
import '../../../core/widgets/custom_text_form.dart';

class RegisterForm extends StatefulWidget {
  final VoidCallback onLoginTap;

  const RegisterForm({super.key, required this.onLoginTap});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<AuthAdminCubit>(context),
      child: Padding(
        padding: ResponsiveHelper.r.paddingAll(20),
        child: BlocListener<AuthAdminCubit, AuthAdminState>(
          listener: (context, state) {
            if (state.isRegisterLoading) {
              DialogService.showLoading(context);
            }
            if (state.isRegisterError) {
              NavigationHelper.pop(context);
              ToastService.error(context, state.errorMessage);
            }
            if (state.isRegisterSuccess) {
              NavigationHelper.pop(context);
              ToastService.success(
                context,
                'Go to login form then login with email and password',
              );
            }
          },
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
                controller: nameController,
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
                controller: emailController,
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
                controller: passwordController,
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
                controller: confirmPasswordController,
                hint: 'اعد ادخال كلمة المرور',
                obscureText: true,
                prefixIcon: SvgIcons.lock,
                filled: true,
                fillColor: DashboardColors.whait,
                colorBorder: Colors.grey[300],
              ),
              Gap(ResponsiveHelper.r.height(2)),
              AppButton(
                text: 'انشاء حساب',
                onPressed: () {
                  context.read<AuthAdminCubit>().registerAdmin(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  );
                },
              ),
              Gap(ResponsiveHelper.r.height(2)),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: CustomRichText(
                  onTap: widget.onLoginTap,
                  hint: 'لديك حساب بالفعل؟',
                  action: 'تسجيل دخول',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
