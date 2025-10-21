import 'package:flutter/material.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

import '../featuers/home/ui/home_screen.dart';

class EntryPoint extends StatelessWidget {
  const EntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveHelper.instance.init(context);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
