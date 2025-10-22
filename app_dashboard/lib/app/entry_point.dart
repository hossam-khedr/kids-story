import 'package:app_dashboard/core/app_routse.dart';
import 'package:app_dashboard/featuers/categories/ui/screens/add_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

import '../featuers/home/ui/home_screen.dart';

class EntryPoint extends StatelessWidget {
  const EntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveHelper.instance.init(context);
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.buildRoutes,
      initialRoute: AppRoutes.home,
    );
  }
}
