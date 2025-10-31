import 'package:app_dashboard/core/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

import '../dashboard_color.dart';
import '../strings.dart';

class CustomTextForm extends StatefulWidget {
  final String hint;
  final bool obscureText;
  final bool filled;
  final Color? fillColor;
  final Color? colorBorder;
  final String? prefixIcon;
  final TextEditingController? controller;

  const CustomTextForm({
    super.key,
    required this.hint,
    this.obscureText = false,
    this.filled = true,
    this.fillColor,
    this.prefixIcon,
    this.controller, this.colorBorder,
  });

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  late bool isPasswordHidden;

  @override
  void initState() {
    super.initState();
    isPasswordHidden = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: isPasswordHidden,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color:widget.colorBorder?? DashboardColors.backgroundColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color:widget.colorBorder?? DashboardColors.backgroundColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: DashboardColors.lightPink, width: 2.0),
        ),
        prefixIcon: Padding(
          padding: ResponsiveHelper.r.paddingAll(8),
          child: SvgPicture.asset(
             widget.prefixIcon ??'',
            color: Colors.grey,
          ),
        ),
        suffixIcon: widget.obscureText
            ? InkWell(
          onTap: () {
            setState(() => isPasswordHidden = !isPasswordHidden);
          },
          child: Padding(
            padding: ResponsiveHelper.r.paddingAll(8),
            child: SvgPicture.asset(
              isPasswordHidden ? SvgIcons.eye : SvgIcons.eyeOff,
              color: Colors.grey,
            ),
          ),
        )
            : null,
        hintText: widget.hint,
        hintStyle: TextStyle(
          fontSize: ResponsiveHelper.r.font(10),
          color: Colors.grey,
        ),
        filled: widget.filled,
        fillColor: widget.fillColor ?? DashboardColors.backgroundColor,
      ),
    );
  }
}

