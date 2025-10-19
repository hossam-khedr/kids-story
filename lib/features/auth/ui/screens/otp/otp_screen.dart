import 'package:flutter/material.dart';

import 'package:kids_story_ai/features/auth/ui/wdgets/otp_fields.dart';
import 'package:kids_story_ai/features/auth/ui/wdgets/resend_code.dart';

import '../../../../../app/index.dart' hide State;

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
