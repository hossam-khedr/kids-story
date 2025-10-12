import 'package:flutter/material.dart';
import 'package:kids_story_ai/features/create_story/create_story_screen.dart';
import 'package:kids_story_ai/features/home/home_screen.dart';
import 'package:kids_story_ai/features/profile/profile_screen.dart';
import 'package:kids_story_ai/features/stores/stores_screen.dart';
import 'package:kids_story_ai/layout_manager/widgets/custom_bottm_nav_bar.dart';

class LayoutManagerScreen extends StatefulWidget {
  const LayoutManagerScreen({super.key});

  @override
  State<LayoutManagerScreen> createState() => _LayoutManagerScreenState();
}

class _LayoutManagerScreenState extends State<LayoutManagerScreen> {
  int currentIndex = 0;

  List<Widget>screens = [
    HomeScreen(),
    StoresScreen(),
    CreateStoryScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

body: IndexedStack(
  index: currentIndex,
  children: screens,
),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTabSelected:(index){
          setState(() {
            currentIndex = index;
          });
        } ,
      ),
    );
  }
}


