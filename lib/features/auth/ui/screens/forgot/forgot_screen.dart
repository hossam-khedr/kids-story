import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:kids_story_ai/core/utils/validators.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/utils/helpers/navigation_helper.dart';
import '../../../../../core/utils/helpers/responsive_helper.dart';
import '../../wdgets/auth_button.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../wdgets/auth_text_field.dart';
import '../../wdgets/setup_auth_screens.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SetupAuthScreens(
        body: Padding(
          padding: ResponsiveHelper.r.paddingSymmetric(horizontal: 10),
          child: SingleChildScrollView(
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
                    data: AppStrings.forgot.tr(),
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Gap(10),
                  AppText(
                    data: AppStrings.forgotPasswordHint.tr(),
                    style: Theme.of(context).textTheme.titleSmall,
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
                            keyboardType: TextInputType.emailAddress,
                            validator: (v) => Validator.validateEmail(v),
                          ),
                          Gap(10),
                          AppButton(
                            text: AppStrings.sendCode.tr(),
                            onTap: () {
                              if(formKey.currentState!.validate()){
                                NavigationHelper.pushNamed(
                                  context,
                                  AppRoutes.reset,
                                );
                              }

                            },
                          ),
                          Gap(5),
                          Center(
                            child: TextButton(
                              onPressed: () =>
                                  NavigationHelper.pushReplacementNamed(
                                    context,
                                    AppRoutes.login,
                                  ),
                              child: AppText(data: AppStrings.backToLogin.tr()),
                            ),
                          ),
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
