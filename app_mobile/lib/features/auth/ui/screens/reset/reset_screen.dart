

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/constants/app_assets.dart';
import 'package:shared/core/constants/app_strings.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/dialog_servises.dart';
import 'package:shared/utils/helpers/navigation_helper.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';
import 'package:shared/utils/toast_service.dart';
import 'package:shared/utils/validators.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../logic/controller/cubit.dart';
import '../../logic/controller/states.dart';
import '../../wdgets/auth_button.dart';
import '../../wdgets/auth_text_field.dart';
import '../../wdgets/setup_auth_screens.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state.isResetLoading) {
            DialogService.showLoading(context);
          }
          if (state.isResetError) {
            NavigationHelper.pop(context);
            ToastService.error(context, state.errorMessage);
          }
          if (state.isResetSuccess) {
            ToastService.success(context, AppStrings.changePasswordMessage.tr());
            NavigationHelper.pushNamedAndRemoveUntil(context, AppRoutes.login);
          }
        },
        child: SetupAuthScreens(
          body: Padding(
            padding: ResponsiveHelper.r.paddingSymmetric(horizontal: 10),
            child: SingleChildScrollView(
              clipBehavior: Clip.none,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.logo,
                      height: ResponsiveHelper.r.height(10),
                    ),
                    Gap(30),
                    AppText(
                      data: AppStrings.resetPassword.tr(),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Gap(10),
                    Center(
                      child: AppText(
                        data: AppStrings.resetPasswordHint.tr(),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Gap(30),
                    Card(
                      child: Padding(
                        padding: ResponsiveHelper.r.paddingAll(18),
                        child: Column(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              data: AppStrings.email.tr(),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            AuthTextField(
                              icon: AppAssets.email,
                              controller: emailController,
                              validator: (v) => Validator.validateEmail(v),
                              keyboardType: TextInputType.emailAddress,
                            ),

                            AppText(
                              data: AppStrings.newPassword.tr(),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            AuthTextField(
                              icon: AppAssets.password,
                              controller: passwordController,
                              validator: (v) => Validator.validatePassword(v),
                              keyboardType: TextInputType.visiblePassword,
                            ),
                            Gap(15),
                            AuthButton(
                              text: AppStrings.reset.tr(),
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  context.read<AuthCubit>().reset(
                                    emailController.text,
                                    passwordController.text,
                                  );
                                }
                              },
                            ),
                            Gap(15),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
