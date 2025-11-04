import 'package:flutter/material.dart';

class CustomCircleProgress extends StatelessWidget {
  final double size;
  final double strokeWidth;
  final Color? color;
  final Color? backgroundColor;
  final double? value; // null => indeterminate, 0..1 => determinate
  final bool showSuccessIcon; // لو عايز تبدل للـ icon بدل الـ spinner
  final Color? successColor;
  final Widget? successIcon;

  const CustomCircleProgress({
    super.key,
    this.size = 20.0,
    this.strokeWidth = 2.5,
    this.color,
    this.backgroundColor,
    this.value,
    this.showSuccessIcon = false,
    this.successColor,
    this.successIcon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = color ?? theme.colorScheme.primary;
    final bg = backgroundColor ?? primary.withOpacity(0.12);
    final successClr = successColor ?? Colors.green;

    // لو المطلوب إظهار أيقونة نجاح بدل الـ spinner
    if (showSuccessIcon) {
      return SizedBox(
        width: size,
        height: size,
        child: Center(
          child: successIcon ??
              Icon(
                Icons.check_circle,
                size: size,
                color: successClr,
              ),
        ),
      );
    }

    // الرسم الأساسي للدائرة: نستخدم Stack علشان نخليها أوسع تحكم
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // الخلفية الدائرية الخفيفة
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: 1.0,
              strokeWidth: strokeWidth,
              valueColor: AlwaysStoppedAnimation<Color>(bg),
            ),
          ),

          // الـ foreground (determinate/indeterminate)
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: value, // null => indeterminate
              strokeWidth: strokeWidth,
              valueColor: AlwaysStoppedAnimation<Color>(primary),
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
