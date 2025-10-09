import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String data;
  final TextStyle?style;
  const AppText({super.key, required this.data, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(data,style:style,);
  }
}
