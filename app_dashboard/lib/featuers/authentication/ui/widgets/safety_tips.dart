import 'package:app_dashboard/core/dashboard_color.dart';
import 'package:flutter/material.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

class SafetyTips extends StatelessWidget {
  const SafetyTips({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: ResponsiveHelper.r.paddingAll(10),
      decoration: BoxDecoration(
        color: Colors.redAccent.withAlpha(20),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        spacing: ResponsiveHelper.r.height(1),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            data: 'نصائح الأمان:',
            style: TextStyle(
              color: Colors.brown,
              fontSize: ResponsiveHelper.r.font(10),
            ),
          ),
          Row(
            spacing: ResponsiveHelper.r.width(1),
            children: [
              const Icon(
                Icons.safety_check_outlined,
                color: Colors.brown,
                size: 18,
              ),
              AppText(
                data: 'استخدم كلمة مرور فريدة لا تستخدمها في مواقع أخرى',
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: ResponsiveHelper.r.font(8),
                ),
              ),
            ],
          ),
          Row(
            spacing: ResponsiveHelper.r.width(1),
            children: [
              const Icon(
                Icons.safety_check_outlined,
                color: Colors.brown,
                size: 18,
              ),
              AppText(
                data: 'امزج بين الأحرف والأرقام والرموز الخاصة',
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: ResponsiveHelper.r.font(8),
                ),
              ),
            ],
          ),
          Row(
            spacing: ResponsiveHelper.r.width(1),
            children: [
              const Icon(
                Icons.safety_check_outlined,
                color: Colors.brown,
                size: 18,
              ),
              AppText(
                data: 'تجنب المعلومات الشخصية الواضحة',
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: ResponsiveHelper.r.font(8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
