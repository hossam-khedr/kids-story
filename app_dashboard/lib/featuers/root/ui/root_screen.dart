import 'dart:async';

import 'package:app_dashboard/app/responsive_helper.dart';
import 'package:app_dashboard/core/dashboard_color.dart';
import 'package:app_dashboard/core/widgets/custom_circle_progress.dart';
import 'package:app_dashboard/core/widgets/story_grid.dart';
import 'package:app_dashboard/featuers/categories/ui/categories_screen.dart';
import 'package:app_dashboard/featuers/dashboard/ui/dashboard_screen.dart';
import 'package:app_dashboard/featuers/root/ui/logic/controller/cubit.dart';
import 'package:app_dashboard/featuers/root/ui/logic/controller/stats.dart';
import 'package:app_dashboard/featuers/root/ui/widgets/root_app_bar.dart';
import 'package:app_dashboard/featuers/root/ui/widgets/search_item.dart';
import 'package:app_dashboard/featuers/root/ui/widgets/side_bar.dart';
import 'package:app_dashboard/featuers/stories/ui/stories_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/core/widgets/app_text.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int currentIndex = 0;
  Timer? _debounce;
  final searchController = TextEditingController();

  void _onSearchChanged(String text) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(seconds: 1), () {
      if (text.isEmpty) {
        context.read<RootCubit>().clearSearch();
      } else {
        context.read<RootCubit>().searchStoriesByTitle(
          search: text,
          page: 1,
          limit: 10,
        );
      }
    });
  }

  List<Widget> pages = [
    const DashboardScreen(),
    const CategoriesScreen(),
    const StoriesScreen(),
    const Center(child: AppText(data: 'Settings')),
  ];

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Row(
          children: [
            Expanded(
              flex: context.responsive.isMobile ? 2 : 1,
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
              flex: 5,
              child: Column(
                children: [
                  RootAppBar(
                    onChanged: _onSearchChanged,
                    controller: searchController,
                  ),
                  Expanded(
                    child: BlocBuilder<RootCubit, RootStats>(
                      builder: (context, state) {
                        if (state.isSearchLoading) {
                          return const Center(
                            child: CustomCircleProgress(
                              color: DashboardColors.pink,
                            ),
                          );
                        }
                        if (state.isSearchError) {
                          return Center(
                            child: AppText(data: state.errorMessage),
                          );
                        }
                        if (state.isSearchSuccess) {
                          return StoryGrid(
                            stats: state,
                            itemCount: state.storiesSearch.length,
                            itemBuilder: (context, index) {
                              return SearchItem(story: state.storiesSearch[index]);
                            },
                          );
                        }
                        return Expanded(child: pages[currentIndex]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
