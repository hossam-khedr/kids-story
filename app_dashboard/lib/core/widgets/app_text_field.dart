import 'package:flutter/material.dart';
import 'package:shared/core/constants/app_colors.dart';
class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Color? fillColor;
  final bool?  filled;
  final int? maxLines;
  const AppTextField({super.key, required this.controller, required this.hintText, this.fillColor, this.filled, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled:filled ,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: AppColors.primary,
            width: 1.5,
          ),
        ),
        hintText: hintText,
        helperStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}
