import 'package:kids_story_ai/app/index.dart' hide State;
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state.isLoginLoading) {
            DialogService.showLoading(context);
          }
          if (state.isLoginError) {
            NavigationHelper.pop(context);
            ToastService.error(context, state.errorMessage);
          }
          if (state.isLoginSuccess) {
            NavigationHelper.pop(context);
            ToastService.success(context, 'Login Successfully');
            // NavigationHelper.pushNamedAndRemoveUntil(context, AppRoutes.login);
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
                            AuthTextField(
                              icon: AppAssets.email,
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (v) => Validator.validateEmail(v),
                            ),
                            AppText(
                              data: AppStrings.password.tr(),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            AuthTextField(
                              icon: AppAssets.password,
                              controller: passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              validator: (v) => Validator.validatePassword(v),
                            ),
                            TextButton(
                              onPressed: () {
                                NavigationHelper.pushNamed(
                                  context,
                                  AppRoutes.forgot,
                                );
                              },
                              child: AppText(data: AppStrings.forgot.tr()),
                            ),
                            AppButton(
                              text: AppStrings.login.tr(),
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  context.read<AuthCubit>().login(
                                    emailController.text,
                                    passwordController.text,
                                  );
                                }
                              },
                            ),
                            Gap(15),
                            Center(
                              child: CustomTextSpan(
                                hint: AppStrings.dontHaveAccount.tr(),
                                action: AppStrings.register.tr(),
                                onTap: () => NavigationHelper.pushNamed(
                                  context,
                                  AppRoutes.register,
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
