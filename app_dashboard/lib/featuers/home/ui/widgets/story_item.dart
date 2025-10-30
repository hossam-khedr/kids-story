import 'package:app_dashboard/core/strings.dart';
import 'package:app_dashboard/featuers/home/ui/widgets/delete_or_update_story.dart';
import 'package:app_dashboard/featuers/home/ui/widgets/delete_story.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/constants/app_colors.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/responses/story_response.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

class StoryItem extends StatelessWidget {
  final StoryResponse response;
  final void Function()? onDelete;
  const StoryItem({super.key, required this.response, this.onDelete});

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
                errorBuilder: (context,object,stackTrace){
                  return Placeholder(
                    fallbackHeight:ResponsiveHelper.r.height(25) ,
                    color: Colors.black54,
                  );
                },
                response.image,
                height: ResponsiveHelper.r.height(25),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            AppText(
              data: response.title,
              style: TextStyle(
                color: AppColors.sidebar,
                fontWeight: FontWeight.bold,
              ),
            ),
            AppText(
              data:
              response.description??"Null",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
                overflow: TextOverflow.ellipsis
              ),
            ),
            Gap(ResponsiveHelper.r.height(2)),
            Row(
              spacing: ResponsiveHelper.r.width(1),
              children: [
                Expanded(
                  child: DeleteOrUpdateStory(
                    color: AppColors.primary,
                    icon: Icons.edit,
                    iconColor: AppColors.primary,
                    text: DashboardStrings.edit,
                    textColor: AppColors.primary,
                  ),
                ),
                DeleteStory(
                  onDelete: onDelete,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}


