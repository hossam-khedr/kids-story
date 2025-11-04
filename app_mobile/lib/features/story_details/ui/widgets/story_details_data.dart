
import 'package:app_mobile/features/story_details/ui/logic/controller/cubit.dart';
import 'package:app_mobile/features/story_details/ui/widgets/play_story_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/core/constants/app_colors.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/core/widgets/custom_network_image.dart';
import 'package:shared/utils/helpers/navigation_helper.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

import '../../../../services/text_to_speck_service.dart';
import 'app_bar_icon.dart';

class StoryDetailsData extends StatefulWidget {
  final String image;
  final String title;
  final String content;
  final String description;

  const StoryDetailsData({
    super.key,
    required this.image,
    required this.title,
    required this.content,
    required this.description,
  });

  @override
  State<StoryDetailsData> createState() => _StoryDetailsDataState();
}

class _StoryDetailsDataState extends State<StoryDetailsData> {
  @override
  void initState() {
    super.initState();
    TextToSpeakService.initTTS();
  }
  @override
  void dispose() {
    super.dispose();
    TextToSpeakService.stop();
  }
  @override
  Widget build(BuildContext context) {
    final state = context.watch<StoryDetailsCubit>().state;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: ResponsiveHelper.r.height(27),
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              children: [
                CustomNetworkImage(src: widget.image, width: double.infinity,),
                Positioned(
                  top: 40,
                  right: 10,
                  child: AppBarIcon(
                    icon: Icons.arrow_back,
                    onBack: () => NavigationHelper.pop(context),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: AppBarIcon(icon: Icons.share),
                ),
                Positioned(
                  top: 40,
                  left: 70,
                  child: AppBarIcon(icon: Icons.favorite_border),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Card(
            margin: ResponsiveHelper.r.paddingAll(15),
            child: Padding(
              padding: ResponsiveHelper.r.paddingSymmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Column(
                spacing: ResponsiveHelper.r.height(2),
                children: [
                  AppText(
                    data: widget.description,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: ResponsiveHelper.r.font(16),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppText(
                    data: widget.title,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: ResponsiveHelper.r.font(14),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  PlayStoryButton(content: widget.content)
                ],
              ),
            ),
          ),
        ),
       state.isRead? SliverToBoxAdapter(
          child: Card(
            margin: ResponsiveHelper.r.paddingAll(15),
            child: Padding(
              padding: ResponsiveHelper.r.paddingSymmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Column(
                children: [
                  AppText(
                    data: 'القصة',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.r.font(20),
                      fontWeight: FontWeight.bold,
                      color: AppColors.foreground,
                    ),
                  ),
                  AppText(
                    data: widget.content,
                    style: TextStyle(
                      fontSize: ResponsiveHelper.r.font(16),
                      fontWeight: FontWeight.normal,
                      color: AppColors.foreground,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ):SliverToBoxAdapter(child: SizedBox.shrink(),),
      ],
    );

  }

}
