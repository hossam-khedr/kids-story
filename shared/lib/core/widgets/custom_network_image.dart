import 'package:flutter/material.dart';

import '../../utils/helpers/responsive_helper.dart';

class CustomNetworkImage extends StatelessWidget {
  final String src;
  final double? width;
  final double? height;
  final double? radius;

  const CustomNetworkImage({
    super.key,
    required this.src,
    this.width,
    this.height, this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius??0),
      child: Image.network(
        src,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (c, o, s) {
          return Icon(Icons.broken_image_outlined, color: Colors.grey);
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return  Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        },

      ),
    );
  }
}
