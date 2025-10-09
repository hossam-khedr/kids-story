import 'package:flutter/material.dart';

class NavigationHelper {

  static Future<T?> pushNamed<T>(
      BuildContext context,
      String routeName, {
        Object? arguments,
      }) {
    return Navigator.of(context).pushNamed<T>(
      routeName,
      arguments: arguments,
    );
  }


  static Future<T?> pushNamedAndRemoveUntil<T>(
      BuildContext context,
      String routeName, {
        Object? arguments,
        bool removeAll = true,
      }) {
    return Navigator.of(context).pushNamedAndRemoveUntil<T>(
      routeName,
          (route) => !removeAll,
      arguments: arguments,
    );
  }


  static Future<T?> pushReplacementNamed<T, TO>(
      BuildContext context,
      String routeName, {
        Object? arguments,
        TO? result,
      }) {
    return Navigator.of(context).pushReplacementNamed<T, TO>(
      routeName,
      arguments: arguments,
      result: result,
    );
  }


  static void pop<T>(BuildContext context, [T? result]) {
    Navigator.of(context).pop(result);
  }


  static void popUntil(BuildContext context, String routeName) {
    Navigator.of(context).popUntil(
      ModalRoute.withName(routeName),
    );
  }


  static bool canPop(BuildContext context) {
    return Navigator.of(context).canPop();
  }
}