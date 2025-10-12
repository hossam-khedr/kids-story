import 'package:flutter/material.dart';
import 'package:kids_story_ai/app/index.dart';

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


