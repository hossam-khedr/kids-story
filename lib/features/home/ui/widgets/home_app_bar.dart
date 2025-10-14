import 'package:flutter/material.dart';
import 'package:kids_story_ai/app/index.dart';


class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(ResponsiveHelper.r.height(3)),
        AppText(
          data: AppStrings.hello.tr(),
          style: TextStyle(
            color: AppColors.whit,
            fontWeight: FontWeight.bold,
            fontSize: ResponsiveHelper.r.font(20),
          ),
        ),
        Gap(ResponsiveHelper.r.height(1)),
        AppText(data: AppStrings.homeMessage.tr(),style: TextStyle(
          color: AppColors.whit,
          fontWeight: FontWeight.bold,
          fontSize: ResponsiveHelper.r.font(14),
        ),),
        Gap(ResponsiveHelper.r.height(4)),
        SizedBox(
          height: ResponsiveHelper.r.height(8),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll<Color>(
                AppColors.secondary,
              ),
              elevation: WidgetStatePropertyAll<double>(0),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            onPressed: () {},
            child: Row(
              spacing: ResponsiveHelper.r.width(2),
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAssets.star,
                  color: AppColors.foreground,
                ),
                AppText(
                  data: AppStrings.createStory.tr(),
                  style: TextStyle(
                    color: AppColors.foreground,
                    fontSize: ResponsiveHelper.r.font(14),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
