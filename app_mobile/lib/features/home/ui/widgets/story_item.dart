import 'package:app_mobile/features/my_library/ui/logic/controller/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/core/constants/app_colors.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/core/widgets/custom_network_image.dart';
import 'package:shared/responses/story_response.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

class StoryItem extends StatelessWidget {
  final StoryResponse storyResponse;
  final void Function()? onTap;
  final void Function()? addToLibraryTap;

  const StoryItem({
    super.key,
    required this.storyResponse,
    this.onTap,
    this.addToLibraryTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // width: ResponsiveHelper.r.width(30),
        margin: ResponsiveHelper.r.paddingSymmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.whit,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: CustomNetworkImage(
                src: storyResponse.image,
                height: ResponsiveHelper.r.height(20),
                width: double.infinity,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    data: storyResponse.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ResponsiveHelper.r.font(16),
                      color: AppColors.primary,
                    ),
                  ),
                  InkWell(
                    onTap: addToLibraryTap,
                    child: Container(
                      padding: ResponsiveHelper.r.paddingAll(4),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: AppText(data: 'اضف الي المكتبه', 
                          style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: ResponsiveHelper.r.font(12)    
                      )),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AppText(
                data: storyResponse.description ?? '',
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
      ),
    );
  }
}
