import 'package:flutter/material.dart';
import 'package:kids_story_ai/features/auth/ui/screens/forgot/forgot_screen.dart';
import 'package:kids_story_ai/features/auth/ui/screens/login/login_screen.dart';
import 'package:kids_story_ai/features/auth/ui/screens/register/register_screen.dart';
import 'package:kids_story_ai/features/auth/ui/screens/reset/reset_screen.dart';

import 'app_routes.dart';

class RouteGenerator {
  static Route? generateRoute(RouteSettings settings) {
    final routeName = settings.name;

    final args = settings.arguments;

    switch (routeName) {
      case AppRoutes.login:
        return _buildRoute(const LoginScreen());
      case AppRoutes.register:
      return  _buildRouteWithAnimation(RegisterScreen());
      case AppRoutes.forgot:
        return  _buildRouteWithAnimation(ForgotScreen());
      case AppRoutes.reset:
        return  _buildRouteWithAnimation(ResetPasswordScreen());

    }
    return null;
  }

  static MaterialPageRoute _buildRoute(
    Widget screen, {
    RouteSettings? settings,
  }) {
    return MaterialPageRoute(builder: (_) => screen, settings: settings);
  }

  static PageRouteBuilder _buildRouteWithAnimation(
    Widget screen, {
    RouteSettings? settings,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Slide Animation
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  static PageRouteBuilder _buildRouteWithFade(
    Widget screen, {
    RouteSettings? settings,
  }) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
