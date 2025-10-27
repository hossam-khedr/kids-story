

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/constants/app_assets.dart';
import 'package:shared/core/constants/app_colors.dart';
import 'package:shared/core/constants/app_strings.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/dialog_servises.dart';
import 'package:shared/utils/helpers/navigation_helper.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';
import 'package:shared/utils/toast_service.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../logic/controller/cubit.dart';
import '../../logic/controller/states.dart';
import '../../wdgets/auth_button.dart';
import '../../wdgets/otp_fields.dart';
import '../../wdgets/resend_code.dart';
import '../../wdgets/setup_auth_screens.dart';

class OtpScreen extends StatefulWidget {
  final String email;

  const OtpScreen({super.key, required this.email});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final OtpController controller = OtpController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state.isOTPLading ) {
            DialogService.showLoading(context);
          }
          if (state.isOTPError) {
            NavigationHelper.pop(context);
            ToastService.error(context, state.errorMessage);
          }
          if (state.isOTPSuccess) {
            ToastService.success(
              context,
              state.otpSuccessMessage ?? '',
            );
            NavigationHelper.pushReplacementNamed(
              context,
              AppRoutes.reset,

            );
          }
        },
        child: SetupAuthScreens(
          body: Padding(
            padding: ResponsiveHelper.r.paddingSymmetric(horizontal: 10),
            child: SingleChildScrollView(
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
                    style: Theme
                        .of(context)
                        .textTheme
                        .displayLarge,
                  ),
                  Gap(10),
                  AppText(
                    data: AppStrings.otpHint.tr(),
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleSmall,
                  ),
                  Gap(30),
                  Card(
                    child: Padding(
                      padding: ResponsiveHelper.r.paddingAll(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OtpTextField(
                            controller: controller,
                            fieldWidth: 40,
                            borderColor: AppColors.darkGray,
                            focusedBorderColor: AppColors.primary,
                            fieldSpacing: 5,
                            filledBackgroundColor: AppColors.foreground
                                .withAlpha(60),
                            filledBorderColor: AppColors.gray,
                          ),
                          Gap(ResponsiveHelper.r.height(1.5)),
                          AuthButton(text: AppStrings.verify.tr(),
                            onTap: () {
                              if (controller.text.isEmpty) {
                                ToastService.error(context, '');
                                return;
                              } else {
                                context.read<AuthCubit>().verifyOTP(
                                    widget.email, controller.text);
                              }
                              controller.clear();
                            },),
                          Gap(ResponsiveHelper.r.height(1.5)),
                          ResendCode(email: widget.email)
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
