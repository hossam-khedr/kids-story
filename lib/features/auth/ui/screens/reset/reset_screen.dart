import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:kids_story_ai/config/routes/app_routes.dart';
import 'package:kids_story_ai/core/utils/helpers/navigation_helper.dart';
import 'package:kids_story_ai/core/utils/validators.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/utils/helpers/responsive_helper.dart';
import '../../wdgets/auth_button.dart';
import '../../../../../core/widgets/app_text.dart';
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
  final codeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SetupAuthScreens(
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
                            data: AppStrings.code.tr(),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          AuthTextField(
                            icon: AppAssets.code,
                            controller: codeController,
                            validator: (v) => Validator.validateRequired(
                              v,
                              codeController.text,
                            ),
                            keyboardType: TextInputType.text,
                          ),
                          AppText(
                            data: AppStrings.newPassword.tr(),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          AuthTextField(icon: AppAssets.password,
                            controller: passwordController,
                            validator: (v) => Validator.validatePassword(v),
                            keyboardType: TextInputType.visiblePassword,),
                          Gap(15),
                          AppButton(
                            text: AppStrings.reset.tr(),
                            onTap: () {
                              if(formKey.currentState!.validate()){
                                NavigationHelper.pushNamedAndRemoveUntil(
                                  context,
                                  AppRoutes.login,
                                );
                              }
                            }
                                ,
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
    );
  }
}
