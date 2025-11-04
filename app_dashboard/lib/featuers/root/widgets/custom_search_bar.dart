import 'package:app_dashboard/core/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomTextForm(hint: 'Search');
  }
}
