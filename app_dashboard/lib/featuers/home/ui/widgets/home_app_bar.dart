import 'package:app_dashboard/core/widgets/add_button.dart';
import 'package:flutter/material.dart';
import 'package:shared/core/constants/app_colors.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/navigation_helper.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

import '../../../../core/app_routse.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          data: "Stories in Animals",
          style: TextStyle(
            fontSize: ResponsiveHelper.r.font(24),
            color: AppColors.sidebar,
            fontWeight: FontWeight.bold,
          ),
        ),

      ],
    );
  }
}
