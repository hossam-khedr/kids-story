import 'package:flutter/material.dart';
import 'package:kids_story_ai/app/index.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = [
      {'text': AppStrings.home.tr(), 'icon': AppAssets.home},
      {'text': AppStrings.library.tr(), 'icon': AppAssets.book},
      {'text': AppStrings.create.tr(), 'icon': AppAssets.star},
      {'text': AppStrings.profile.tr(), 'icon': AppAssets.profile},
    ];

    return SizedBox(
      height: ResponsiveHelper.r.height(13),
      child: Card(
        color: Colors.white,
        elevation: 0,
        shadowColor: Colors.black12,
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Row(
          children: List.generate(tabs.length, (index) {
            final tab = tabs[index];
            return Expanded(
              child: TabBottom(
                text: tab['text'] as String,
                icon: tab['icon'] as String,
                isSelected: currentIndex == index,
                onTap: () => onTabSelected(index),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class TabBottom extends StatelessWidget {
  final bool isSelected;
  final String text;
  final String icon;
  final void Function()? onTap;

  const TabBottom({
    super.key,
    required this.text,
    required this.icon,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Padding(
        padding: ResponsiveHelper.r.paddingSymmetric(
          vertical: 10,
          horizontal: 12,
        ),
        child: Container(
          padding: ResponsiveHelper.r.paddingAll(10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                color: isSelected ? Colors.white : AppColors.primary,
              ),
              Text(
                text,
                style: TextStyle(
                  color: isSelected ? Colors.white : AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: isSelected
                      ? ResponsiveHelper.r.font(14)
                      : ResponsiveHelper.r.font(12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
