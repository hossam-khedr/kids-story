
import 'package:app_dashboard/featuers/categories/ui/categories_screen.dart';
import 'package:app_dashboard/featuers/dashboard/ui/dashboard_screen.dart';
import 'package:app_dashboard/featuers/root/widgets/root_app_bar.dart';
import 'package:app_dashboard/featuers/root/widgets/side_bar.dart';
import 'package:app_dashboard/featuers/stories/ui/stories_screen.dart';
import 'package:flutter/material.dart';
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
    const CategoriesScreen(),
    const StoriesScreen(),
    const Center(child: AppText(data: 'Settings')),
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
                  const RootAppBar(),
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
