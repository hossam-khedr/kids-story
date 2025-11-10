import 'package:app_dashboard/core/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  const CustomSearchBar({super.key, this.onChanged, this.controller});

  @override
  Widget build(BuildContext context) {
    return  CustomTextForm(hint: 'Search',onChanged: onChanged,controller: controller,);
  }
}
