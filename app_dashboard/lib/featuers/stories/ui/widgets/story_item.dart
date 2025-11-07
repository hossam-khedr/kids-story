import 'dart:math';

import 'package:app_dashboard/core/dashboard_color.dart';
import 'package:app_dashboard/core/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared/core/constants/api_constants.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/core/widgets/custom_network_image.dart';
import 'package:shared/responses/story_response.dart';
import 'package:shared/utils/date_formatter.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';
import 'package:shared/utils/helpers/helper_functions.dart';

import '../../../../core/svg_icon.dart';

class StoryItem extends StatelessWidget {
  final Story story;

  const StoryItem({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    final color = getNiceRandomColor();
    final formateDate = formatArabicDate(story.createdAt);
    return Card(
      color: DashboardColors.whait,
      child: Column(
        children: [
          CustomNetworkImage(
            src: '${ApiConstants.baseUrl}/${story.imageUrl}',
            width: double.infinity,
            height: ResponsiveHelper.r.height(33),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          Space(space: ResponsiveHelper.r.height(2)),
          Padding(
            padding: ResponsiveHelper.r.paddingAll(12),
            child: Column(
              spacing: ResponsiveHelper.r.height(3),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: ResponsiveHelper.r.paddingAll(4),
                  decoration: BoxDecoration(
                    color: color.withAlpha(60),
                    borderRadius: BorderRadius.circular(19),
                  ),
                  child: Text(
                    story.category.name,
                    style: TextStyle(
                      color: color,
                      fontSize: ResponsiveHelper.r.font(6),
                    ),
                  ),
                ),
                AppText(
                  data: story.title,
                  style: TextStyle(fontSize: ResponsiveHelper.r.font(8)),
                ),
                AppText(
                  data: formateDate,
                  style: TextStyle(
                    fontSize: ResponsiveHelper.r.font(7),
                    color: Colors.grey[400],
                  ),
                ),
                Row(
                  spacing: ResponsiveHelper.r.width(1),
                  children: [
                    Expanded(
                      child: Container(
                        padding: ResponsiveHelper.r.paddingAll(4),
                        decoration: BoxDecoration(
                          color: Colors.blue.withAlpha(50),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(
                          SvgIcons.edit,
                          color: DashboardColors.blue,
                          height: ResponsiveHelper.r.height(3.5),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: ResponsiveHelper.r.paddingAll(4),
                        decoration: BoxDecoration(
                          color: Colors.red.withAlpha(50),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(
                          SvgIcons.delete,
                          color: Colors.red,
                          height: ResponsiveHelper.r.height(3.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
