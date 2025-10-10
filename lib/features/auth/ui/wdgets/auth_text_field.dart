import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids_story_ai/core/constants/app_colors.dart';
import 'package:kids_story_ai/core/utils/helpers/responsive_helper.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String icon;
  final TextInputType? keyboardType;

  const AuthTextField({
    super.key,
     this.controller,
    this.validator,
    required this.icon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: ResponsiveHelper.r.paddingAll(12),
          child: SvgPicture.asset(icon, color: AppColors.primary,height: 10,),
        ),
      ),
    );
  }
}
