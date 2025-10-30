import 'package:app_dashboard/core/dashboard_color.dart';
import 'package:app_dashboard/core/strings.dart';
import 'package:flutter/material.dart';
import 'package:shared/core/constants/app_colors.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveHelper.r.height(6),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: DashboardColors.backgroundColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: DashboardColors.backgroundColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: DashboardColors.lightPink, width: 2.0),
          ),
          prefixIcon: Icon(Icons.search,color: Colors.grey,),
          hintText: DashboardStrings.searchForStories,
          hintStyle: TextStyle(
            fontSize: ResponsiveHelper.r.font(10),
            color: Colors.grey
          ),
          filled: true,
          fillColor: DashboardColors.backgroundColor
        ),
      ),
    );
  }
}
