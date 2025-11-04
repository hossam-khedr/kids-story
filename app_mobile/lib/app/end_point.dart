import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared/core/constants/api_constants.dart';
import 'package:shared/core/theme/app_theme.dart';
import 'package:shared/utils/helpers/cache_helper.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';
import 'package:shared/utils/helpers/widgets/base_cubit_wrapper.dart';
import '../config/routes/app_routes.dart';
import '../config/routes/route_generator.dart';



class KidsStory extends StatefulWidget {
  const KidsStory({super.key});

  @override
  State<KidsStory> createState() => _KidsStoryState();
}

class _KidsStoryState extends State<KidsStory> {
  final userToken = CacheHelper.getString(ApiConstants.tokenKey);
  @override
  Widget build(BuildContext context) {
    ResponsiveHelper.instance.init(context);
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        //darkTheme: AppTheme.darkTheme,
        // themeMode: themeProvider.themeMode,
        localizationsDelegates: [...context.localizationDelegates],
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        initialRoute:userToken!=null? AppRoutes.layoutManager:AppRoutes.login,

        onGenerateRoute: RouteGenerator.generateRoute,

    );
  }
}


