import 'package:app_dashboard/featuers/home/ui/widgets/delete_or_update_story.dart';
import 'package:flutter/material.dart';
import 'package:shared/core/constants/app_colors.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.none,
      margin: EdgeInsets.zero,
      color: AppColors.whit,
      child: Padding(
        padding: ResponsiveHelper.r.paddingSymmetric(horizontal: 10,vertical: 5),
        child: Column(
          spacing: ResponsiveHelper.r.height(1),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://images.pexels.com/photos/1054655/pexels-photo-1054655.jpeg',
              ),
            ),
            AppText(
              data: 'The Lust boby',
              style: TextStyle(
                color: AppColors.sidebar,
                fontWeight: FontWeight.bold,
              ),
            ),
            AppText(
              data:
              'hgvfdrwpl,mnhgdreedsjkkdmmncxbvtrqeevxcocppcl,cmcncbcgtrwwfvvxhxhxxtxrxr',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
            Row(
              spacing: ResponsiveHelper.r.width(1),
              children: [
                Expanded(
                  child: DeleteOrUpdateStory(
                    color: AppColors.primary,
                    icon: Icons.edit,
                    iconColor: AppColors.primary,
                    text: 'Edit',
                    textColor: AppColors.primary,
                  ),
                ),
                Expanded(
                  child: DeleteOrUpdateStory(
                    color: AppColors.red,
                    icon: Icons.delete_forever_outlined,
                    iconColor: AppColors.red,
                    text: 'Delete',
                    textColor: AppColors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


