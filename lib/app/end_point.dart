import 'package:flutter/material.dart';
import 'package:kids_story_ai/app/index.dart' hide State;


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
    return MaterialApp(
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


