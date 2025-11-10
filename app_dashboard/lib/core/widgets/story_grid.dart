import 'package:app_dashboard/app/responsive_helper.dart';
import 'package:app_dashboard/featuers/stories/ui/logic/controller/stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../featuers/stories/ui/logic/controller/cubit.dart';
import '../../featuers/stories/ui/widgets/story_item.dart';

class StoryGrid extends StatelessWidget {
  final dynamic stats;
  final int? itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;
  const StoryGrid({super.key, required this.stats, this.itemCount, required this.itemBuilder, });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount:itemCount,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: context.responsive.gridColumns,
          crossAxisSpacing: context.responsive.screenWidth * 0.010,
          mainAxisSpacing: context.responsive.screenHeight * 0.010,
          childAspectRatio:context.responsive.isMobile?0.82: 0.60,
        ),
        itemBuilder: itemBuilder,
      ),
    );
  }
}
