import 'package:flutter/material.dart';
import 'package:kids_story_ai/app/index.dart';
import 'package:kids_story_ai/core/utils/helpers/responsive_helper.dart';
import 'package:kids_story_ai/features/story_details/ui/widgets/app_bar_icon.dart';

class StoryDetailsScreen extends StatelessWidget {
  final int storyId;

  const StoryDetailsScreen({super.key, required this.storyId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: ResponsiveHelper.r.height(27),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Image.network(
                    'https://cdn.pixabay.com/photo/2025/07/20/08/07/alley-9723861_640.jpg',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
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
                      data: 'مغامرة القلعة السحرية',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: ResponsiveHelper.r.font(16),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AppText(
                      data:
                          'انضم إلى الأميرة لونا في رحلتها السحرية عبر القلعة المسحورة حيث تلتقي بالحيوانات الناطقة، وتكتشف الغرف السرية، وتتعلم قوة اللطف.',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: ResponsiveHelper.r.font(14),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all<OutlinedBorder?>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        backgroundColor: WidgetStateProperty.all(
                          AppColors.primary,
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_arrow,
                            color: AppColors.whit,
                            size: 25,
                          ),
                          AppText(
                            data: 'استمع',
                            style: TextStyle(
                              color: AppColors.whit,
                              fontSize: ResponsiveHelper.r.font(16),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                      data:
                          'في يوم من الأيام، في أرض بعيدة، عاشت أميرة شجاعة اسمها لونا. في صباح مشمس، اكتشفت باباً مخفياً في مكتبة القلعة. خلفه كان عالم سحري مليء بالعجائب...',
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
          ),
        ],
      ),
    );
  }
}
