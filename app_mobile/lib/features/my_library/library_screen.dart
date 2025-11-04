import 'package:app_mobile/features/my_library/ui/logic/controller/cubit.dart';
import 'package:app_mobile/features/my_library/ui/widgets/all_stories.dart';
import 'package:app_mobile/features/my_library/ui/widgets/app_bar_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/constants/app_assets.dart';
import 'package:shared/core/constants/app_colors.dart';
import 'package:shared/core/constants/app_strings.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/core/widgets/custom_app_bar.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  bool isSelectedFiv = false;
  @override
  void initState() {
    super.initState();
    context.read<LibraryCubit>().getStoriesFromLibrary();
  }

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
        slivers: [
          CustomAppBar(
            expandedHeight: ResponsiveHelper.r.height(22),
            child: Padding(
              padding: ResponsiveHelper.r.paddingSymmetric(
                vertical: 15,
                horizontal: 10,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        data: AppStrings.library.tr(),
                        style: TextStyle(
                          color: AppColors.whit,
                          fontSize: ResponsiveHelper.r.font(20),
                        ),
                      ),
                      SvgPicture.asset(
                        AppAssets.book,
                        color: AppColors.whit,
                        height: ResponsiveHelper.r.height(5),
                      ),
                    ],
                  ),
                  Gap(ResponsiveHelper.r.height(5)),
                  Container(
                    padding: ResponsiveHelper.r.paddingAll(5),
                    decoration: BoxDecoration(
                      color: AppColors.whit.withAlpha(70),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: AppBarButton(
                            isFavorites: isSelectedFiv,
                            title: AppStrings.favorites.tr(),
                            onChanged: () {
                              setState(() {
                                isSelectedFiv = true;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: AppBarButton(
                            isFavorites: !isSelectedFiv,
                            title: AppStrings.allStories.tr(),
                            onChanged: () {
                              setState(() {
                                isSelectedFiv = false;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          isSelectedFiv
              ? SliverToBoxAdapter(child: Center(child: AppText(data: 'Favorites')))
              : AllStories(),
        ],
      );

  }
}
