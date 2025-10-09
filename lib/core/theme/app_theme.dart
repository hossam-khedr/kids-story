import 'package:flutter/material.dart';

import 'dark_theme.dart';
import 'light_theme.dart';

class AppTheme {

  AppTheme._();


  static ThemeData get lightTheme => LightTheme.theme;


  static ThemeData get darkTheme => DarkTheme.theme;


  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }


  static Color getPrimaryColor(BuildContext context) {
    return Theme.of(context).primaryColor;
  }


  static Color getBackgroundColor(BuildContext context) {
    return Theme.of(context).scaffoldBackgroundColor;
  }
}