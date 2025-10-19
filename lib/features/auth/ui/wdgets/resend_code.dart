import 'package:flutter/material.dart';

import '../../../../app/index.dart';

class ResendCode extends StatelessWidget {
  final String email;
  const ResendCode({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit,AuthStates>(
      listener: (context, state) {
        if (state.isForgotLoading) {
          DialogService.showLoading(context);
        }
        if (state.isForgotError) {
          NavigationHelper.pop(context);
          ToastService.error(context, state.errorMessage);
        }
        if (state.isForgotSuccess) {
          NavigationHelper.pop(context);
          ToastService.success(
            context,
            state.forgotPasswordResponse!.code,
            title: state.forgotPasswordResponse!.message,
            duration: 30,
          );

        }
      },
      child: TextButton(
        onPressed: () {
          context.read<AuthCubit>().forgot(email);
        },
        child: AppText(
          data: AppStrings.resendCode.tr(),
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
