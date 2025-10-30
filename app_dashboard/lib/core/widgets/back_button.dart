import 'package:app_dashboard/core/strings.dart';
import 'package:flutter/material.dart';
import 'package:shared/core/constants/app_colors.dart';
import 'package:shared/utils/helpers/navigation_helper.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => NavigationHelper.pop(context),
      child: Row(
        children: [
          Icon(Icons.arrow_back, color: AppColors.foreground),
          Text(
            DashboardStrings.backToDashboard,
            style: TextStyle(
              height: 1.5,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
        ],
      ),
    );
  }
}
