import 'package:flutter/material.dart';
import 'package:shared/core/constants/app_colors.dart';

class ProgressBar extends StatelessWidget {
  final double value;
  final double height;
  final BorderRadiusGeometry borderRadius;

  const ProgressBar({
    super.key,
    required this.value,
    this.height = 14,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: borderRadius,
          ),
        ),

        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth * value;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              width: width,
              height: height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.pink, AppColors.primary],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: borderRadius,
              ),
            );
          },
        ),

      ],
    );
  }
}
