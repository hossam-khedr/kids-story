import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_story_ai/app/di.dart';
import 'package:kids_story_ai/features/home/ui/logic/controller/home_cubit.dart';
import 'package:kids_story_ai/layout_manager/widgets/custom_bottm_nav_bar.dart';

import '../features/create_story/create_story_screen.dart';
import '../features/home/ui/home_screen.dart';
import '../features/profile/profile_screen.dart';
import '../features/stores/stores_screen.dart';
import 'logic/layout_cubit.dart';
import 'logic/layout_states.dart';

class LayoutManagerScreen extends StatefulWidget {
  const LayoutManagerScreen({super.key});

  @override
  State<LayoutManagerScreen> createState() => _LayoutManagerScreenState();
}

class _LayoutManagerScreenState extends State<LayoutManagerScreen> {
  final ValueNotifier<int> bottomNavIndex = ValueNotifier(0);

  final List<Widget> screens = [
    BlocProvider(
      child: HomeScreen(),
      create: (_) => getIt<HomeCubit>(),
    ),
    StoresScreen(),
    CreateStoryScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: bottomNavIndex,
        builder: (context, index, _) {
          return IndexedStack(index: index, children: screens);
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: bottomNavIndex,
        builder: (context, index, _) {
          return CustomBottomNavBar(
            currentIndex: index,
            onTabSelected: (newIndex) {
              bottomNavIndex.value = newIndex;
            },
          );
        },
      ),
    );
  }
}
