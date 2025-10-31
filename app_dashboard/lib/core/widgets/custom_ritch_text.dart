
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../dashboard_color.dart';

class CustomRichText extends StatelessWidget {
  final VoidCallback onTap;
  final String hint;
  final String action;

  const CustomRichText({super.key, required this.onTap, required this.hint, required this.action});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: hint,
        style: TextStyle(
          color: DashboardColors.darkGray,
          fontSize: 14,
        ),
        children: [
          TextSpan(
            text: action,
            style: TextStyle(
              color: DashboardColors.pink,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}