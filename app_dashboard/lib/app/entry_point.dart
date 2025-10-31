import 'package:app_dashboard/core/app_routse.dart';
import 'package:app_dashboard/core/dashboard_color.dart';
import 'package:flutter/material.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';
import 'package:shared/utils/helpers/widgets/base_cubit_wrapper.dart';

class EntryPoint extends StatelessWidget {
  const EntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveHelper.instance.init(context);
    return BaseCubitWrapper(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.buildRoutes,
        initialRoute: AppRoutes.auth,
        theme: ThemeData(
          scaffoldBackgroundColor: DashboardColors.backgroundColor,
          // appBarTheme: AppBarThemeData(
          //   backgroundColor: DashboardColors.whait
          // )
        ),
      ),
    );
  }
}
