import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kids_story_ai/app/index.dart' hide State;

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
      body: BlocListener<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state.isForgotLoading) {
            DialogService.showLoading(context);
          }
          if (state.isForgotError) {
            NavigationHelper.pop(context);
            ToastService.error(context, state.errorMessage);
          }
          if (state.isForgotSuccess) {
            DialogService.success(
              context,
              message: state.forgotPasswordResponse!.code,
              title: state.forgotPasswordResponse!.message,
              buttonText: AppStrings.copyCode.tr(),
              onConfirm: () {
                Clipboard.setData(
                  ClipboardData(text: state.forgotPasswordResponse!.code),
                ).then((v) {
                  if (!mounted) return;
                  NavigationHelper.pushReplacementNamed(
                    context,
                    AppRoutes.reset,
                  );
                });
              },
            );
          }
        },
        child: SetupAuthScreens(
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
                                if (formKey.currentState!.validate()) {
                                  context.read<AuthCubit>().forgot(
                                    emailController.text,
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
                                child: AppText(
                                  data: AppStrings.backToLogin.tr(),
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
          ),
        ),
      ),
    );
  }
}
