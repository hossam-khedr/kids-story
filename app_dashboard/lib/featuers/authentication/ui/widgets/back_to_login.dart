import 'package:flutter/material.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

import '../../../../core/dashboard_color.dart';

class BackToLogin extends StatelessWidget {
  final void Function()? onPressed;
  const BackToLogin({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.arrow_back,
          size: 15,
          color: DashboardColors.darkGray,
        ),
        TextButton(
          onPressed: onPressed,
          child: AppText(
            data: 'العودة لتسجيل الدخول',
            style: TextStyle(
              color: DashboardColors.darkGray,
              fontWeight: FontWeight.w200,
              fontSize: ResponsiveHelper.r.font(10),
            ),
          ),
        ),
      ],
    );
  }
}
