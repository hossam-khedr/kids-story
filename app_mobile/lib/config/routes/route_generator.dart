import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app/di.dart';
import '../../features/auth/ui/logic/controller/cubit.dart';
import '../../features/auth/ui/screens/forgot/forgot_screen.dart';
import '../../features/auth/ui/screens/login/login_screen.dart';
import '../../features/auth/ui/screens/otp/otp_screen.dart';
import '../../features/auth/ui/screens/register/register_screen.dart';
import '../../features/auth/ui/screens/reset/reset_screen.dart';
import '../../features/story_details/ui/logic/controller/cubit.dart';
import '../../features/story_details/ui/story_details_screen.dart';
import '../../layout_manager/layout_manager_screen.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route? generateRoute(RouteSettings settings) {
    final routeName = settings.name;

    final args = settings.arguments;

    switch (routeName) {
      case AppRoutes.login:
        return _buildRoute(
          BlocProvider(child: LoginScreen(), create: (_)=>getIt<AuthCubit>(),),
        );
      case AppRoutes.register:
        return _buildRouteWithAnimation(
          BlocProvider(
            child: RegisterScreen(),
            create: (_) => getIt<AuthCubit>(),
          ),
        );
      case AppRoutes.forgot:
        return _buildRouteWithAnimation(
          BlocProvider(
            child: ForgotScreen(),
            create: (_) => getIt<AuthCubit>(),
          ),
        );
      case AppRoutes.otp:
        final email = args as String;
        return _buildRouteWithAnimation(
          BlocProvider(
            child: OtpScreen(email: email),
            create: (_) => getIt<AuthCubit>(),
          ),
        );
      case AppRoutes.reset:
        return _buildRouteWithAnimation(
          BlocProvider(
            child: ResetPasswordScreen(),
            create: (_) => getIt<AuthCubit>(),
          ),
        );
      case AppRoutes.layoutManager:
        return _buildRouteWithAnimation(LayoutManagerScreen());

      case AppRoutes.storyDetails:
        final storyId = args as int;
        return _buildRouteWithAnimation(
          BlocProvider(
            child: StoryDetailsScreen(storyId: storyId),
            create: (_) => getIt<StoryDetailsCubit>(),
          ),
        );
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
