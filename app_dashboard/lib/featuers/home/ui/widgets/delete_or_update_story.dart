import 'package:flutter/material.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

class DeleteOrUpdateStory extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Color iconColor;
  final String text;
  final Color textColor;
  final void Function()? onTap;

  const DeleteOrUpdateStory({
    super.key,
    required this.color,
    required this.icon,
    required this.iconColor,
    required this.text,
    required this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: ResponsiveHelper.r.paddingAll(5),
        decoration: BoxDecoration(
          color: color.withAlpha(70),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor),
            AppText(
              data: text,
              style: TextStyle(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}