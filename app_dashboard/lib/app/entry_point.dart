import 'package:app_dashboard/core/app_routse.dart';
import 'package:app_dashboard/core/dashboard_color.dart';
import 'package:flutter/material.dart';
import 'package:shared/core/constants/api_constants.dart';
import 'package:shared/utils/helpers/cache_helper.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';
import 'package:shared/utils/helpers/widgets/base_cubit_wrapper.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  String isAdminLogdin(){
    final  accessToken = CacheHelper.getString(ApiConstants.adminAccessToken);
    print("ACCESS TOKEN : $accessToken");
    return accessToken==null?AppRoutes.auth:AppRoutes.root;
  }


  @override
  Widget build(BuildContext context) {
    ResponsiveHelper.instance.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.buildRoutes,
      initialRoute:isAdminLogdin(),
      theme: ThemeData(
        scaffoldBackgroundColor: DashboardColors.backgroundColor,
        fontFamily: 'DG Trika',
        // appBarTheme: AppBarThemeData(
        //   backgroundColor: DashboardColors.whait
        // )
      ),
    );
  }
}
