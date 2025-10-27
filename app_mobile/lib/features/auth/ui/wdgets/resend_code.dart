
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/core/constants/app_colors.dart';
import 'package:shared/core/constants/app_strings.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/dialog_servises.dart';
import 'package:shared/utils/helpers/navigation_helper.dart';
import 'package:shared/utils/toast_service.dart';

import '../logic/controller/cubit.dart';
import '../logic/controller/states.dart';

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
