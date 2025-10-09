import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_story_ai/core/utils/responsive_helper.dart';
import 'package:kids_story_ai/core/utils/toast_service.dart';

import 'config/routes/app_routes.dart';
import 'config/routes/route_generator.dart';
import 'core/theme/app_theme.dart';

class KidsStory extends StatelessWidget {
  const KidsStory({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveHelper.instance.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      //darkTheme: AppTheme.darkTheme,
      // themeMode: themeProvider.themeMode,
      localizationsDelegates: [...context.localizationDelegates],
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: AppRoutes.login,

      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}


