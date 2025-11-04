import 'package:flutter/material.dart';
import 'package:shared/core/constants/app_colors.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

class AppBarButton extends StatelessWidget {
  final bool isFavorites;
  final String title;
  final void Function() onChanged;

  const AppBarButton({
    super.key,
    required this.isFavorites,
    required this.title,required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>onChanged(),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isFavorites ? AppColors.whit : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: ResponsiveHelper.r.paddingAll(10),
          child: AppText(
            data: title,
            style: TextStyle(
              color: isFavorites ? AppColors.primary : AppColors.whit,
            ),
          ),
        ),
      ),
    );
  }
}
