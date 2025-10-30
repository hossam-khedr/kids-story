import 'package:app_dashboard/core/dashboard_color.dart';
import 'package:app_dashboard/core/widgets/app_text_field.dart';
import 'package:app_dashboard/featuers/dashboard/ui/dashboard_screen.dart';
import 'package:app_dashboard/featuers/home/ui/widgets/search_bar.dart';
import 'package:app_dashboard/featuers/root/widgets/root_app_bar.dart';
import 'package:app_dashboard/featuers/root/widgets/side_bar.dart';
import 'package:app_dashboard/featuers/root/widgets/side_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:shared/core/constants/app_colors.dart';
import 'package:shared/core/widgets/app_text.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int currentIndex = 0;

  List<Widget> pages = [
  const DashboardScreen(),
    Center(child: AppText(data: 'Category')),
    Center(child: AppText(data: 'Stories')),
    Center(child: AppText(data: 'Settings')),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Row(
          children: [
            Expanded(
              child: RootSideBar(
                currentIndex: currentIndex,
                onItemSelected: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  RootAppBar(),
                  Expanded(child: pages[currentIndex]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
