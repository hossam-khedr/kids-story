import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kids_story_ai/app/index.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  CacheHelper.initCacheHelper();
  DioHelper.init();
  await initApp();
  await initLayout();
  await initHomeModule();
  await initAuthModule();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      child: const KidsStory(),
    ),
  );
}
