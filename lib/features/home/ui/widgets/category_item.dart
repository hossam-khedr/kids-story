import 'package:flutter/material.dart';
import 'package:kids_story_ai/app/index.dart';

class CategoryItem extends StatelessWidget {
  final void Function()? onTap;
  final bool isSelected;
  final int currentIndex;
  final String image;
  final String title;

  const CategoryItem({
    super.key,
    this.onTap,
    required this.isSelected,
    required this.currentIndex,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? null : AppColors.whit,
          borderRadius: BorderRadius.circular(20),
          gradient: isSelected
              ? LinearGradient(
                  stops: [0.3, 2.0],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [AppColors.pink, AppColors.primary],
                )
              : null,
        ),
        child: Padding(
          padding: ResponsiveHelper.r.paddingAll(8),
          child: Column(
            spacing: ResponsiveHelper.r.height(1),
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  width: ResponsiveHelper.r.width(25),
                  height: ResponsiveHelper.r.width(20),
                  fit: BoxFit.cover,
                ),
              ),
              AppText(
                data: title,
                style: TextStyle(
                  color: isSelected ? AppColors.whit : AppColors.foreground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
