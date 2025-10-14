import 'package:flutter/material.dart';
import 'package:kids_story_ai/app/index.dart';
import 'package:kids_story_ai/features/home/data/responses/story_response.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoryItem extends StatelessWidget {
  final StoryResponse storyResponse;

  const StoryItem({super.key, required this.storyResponse});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: ResponsiveHelper.r.width(30),
      margin: ResponsiveHelper.r.paddingSymmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.whit,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.network(
              storyResponse.image,
              height: ResponsiveHelper.r.height(32),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: AppText(
              data: storyResponse.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ResponsiveHelper.r.font(16),
                color: AppColors.primary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: AppText(
              data: storyResponse.description,
              // maxLines: 2,
              // overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.normal,
                fontSize: ResponsiveHelper.r.font(14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
