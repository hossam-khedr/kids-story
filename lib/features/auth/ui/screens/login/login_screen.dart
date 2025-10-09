import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:kids_story_ai/config/routes/app_routes.dart';
import 'package:kids_story_ai/core/constants/app_assets.dart';
import 'package:kids_story_ai/core/constants/app_strings.dart';
import 'package:kids_story_ai/core/utils/helpers.dart';
import 'package:kids_story_ai/core/utils/responsive_helper.dart';
import 'package:kids_story_ai/core/widgets/app_button.dart';
import 'package:kids_story_ai/core/widgets/app_text.dart';
import 'package:kids_story_ai/features/auth/ui/wdgets/custom_text_span.dart';
import 'package:kids_story_ai/features/auth/ui/wdgets/setup_auth_screens.dart';

import '../../../../../core/constants/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                data: AppStrings.welcome.tr(),
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Gap(10),
              AppText(
                data: AppStrings.singInToCon.tr(),
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
                      TextFormField(),
                      AppText(
                        data: AppStrings.password.tr(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      TextFormField(),

                      TextButton(
                        onPressed: () {},
                        child: AppText(data: AppStrings.forgot.tr()),
                      ),
                      AppButton(text: AppStrings.login.tr()),
                      Gap(15),
                      Center(
                        child: CustomTextSpan(
                          hint: AppStrings.dontHaveAccount.tr(),
                          action: AppStrings.register.tr(),
                          onTap: ()=> NavigationHelper.pushNamed(context, AppRoutes.register),
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
