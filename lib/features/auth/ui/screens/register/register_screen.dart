import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/utils/helpers.dart';
import '../../../../../core/utils/responsive_helper.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../wdgets/custom_text_span.dart';
import '../../wdgets/setup_auth_screens.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SetupAuthScreens(
        body: Padding(
          padding: ResponsiveHelper.r.paddingSymmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppAssets.logo,
                height: ResponsiveHelper.r.height(10),
              ),
              Gap(30),
              AppText(
                data: AppStrings.newAccount.tr(),
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Gap(10),
              AppText(
                data: AppStrings.registerHint.tr(),
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
                        data: AppStrings.name.tr(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      TextFormField(),
                      AppText(
                        data: AppStrings.email.tr(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      TextFormField(),
                      AppText(
                        data: AppStrings.password.tr(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      TextFormField(),
                      Gap(15),
                      AppButton(text: AppStrings.register.tr()),
                      Gap(15),
                      Center(
                        child: CustomTextSpan(
                          hint: AppStrings.alreadyHaveAccount.tr(),
                          action: AppStrings.login.tr(),
                          onTap: () => NavigationHelper.pushNamedAndRemoveUntil(
                            context,
                            AppRoutes.login,
                          ),
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
    );
  }
}
