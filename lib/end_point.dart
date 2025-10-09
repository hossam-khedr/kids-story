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
      darkTheme: AppTheme.darkTheme,
      // themeMode: themeProvider.themeMode,
      localizationsDelegates: [...context.localizationDelegates],
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: HomeScreen(),
      initialRoute: "AppRoutes.splash",

      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            TextButton(onPressed: () {
              ToastService.success(context, 'Success Message');
            }, child: Text('success')),
            TextButton(onPressed: () {
              ToastService.warning(context, 'Warning Message');
            }, child: Text('warning')),
            TextButton(onPressed: () {
              ToastService.error(context, 'Error Message');
            }, child: Text('error')),
            TextButton(onPressed: () {
              ToastService.info(context, 'Info Message');
            }, child: Text('info')),
          ],
        ),
      ),
    );
  }
}
