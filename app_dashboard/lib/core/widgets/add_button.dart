import 'package:flutter/material.dart';
import 'package:shared/core/constants/app_colors.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';
class AddButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const AddButton({super.key, required this.text, this.onTap, });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: ResponsiveHelper.r.paddingSymmetric(vertical: 3,horizontal: 5),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: ResponsiveHelper.r.width(0.4),
            children: [
              Icon(Icons.add_circle,color: AppColors.whit,),
              AppText(data: text,style: TextStyle(
                  color: AppColors.whit,
                  fontSize: ResponsiveHelper.r.font(10)

              ),),

            ],
          ),
        ),
      ),
    );
  }
}
