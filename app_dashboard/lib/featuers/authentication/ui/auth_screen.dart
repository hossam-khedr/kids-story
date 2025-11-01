import 'package:app_dashboard/core/dashboard_color.dart';
import 'package:app_dashboard/featuers/authentication/ui/forgot_form.dart';
import 'package:app_dashboard/featuers/authentication/ui/login_form.dart';
import 'package:app_dashboard/featuers/authentication/ui/register_form.dart';
import 'package:app_dashboard/featuers/authentication/ui/reset_form.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  int _currentIndex = 0;

  void _goTo(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: ResponsiveHelper.r.paddingAll(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: DashboardColors.pink,
                    child: Icon(
                      Icons.book_outlined,
                      color: DashboardColors.whait,
                    ),
                  ),
                  AppText(data: 'حكايات',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: ResponsiveHelper.r.font(16)
                  ),),
                  AppText(data: 'مرحباً بك في عالم قصص الأطفال',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: ResponsiveHelper.r.font(10)
                  ),),
                  Gap(ResponsiveHelper.r.height(4)),
                  SizedBox(
                    width: ResponsiveHelper.r.width(35),
                   // height: ResponsiveHelper.r.height(120),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                      ),
                      color: DashboardColors.whait,
                    child: IndexedStack(
                      index: _currentIndex,
                      children: [
                        LoginForm(
                          createAccount: () => _goTo(1),
                          forgotTap: () => _goTo(2),
                        ),
                        RegisterForm(
                          onLoginTap: () => _goTo(0),
                        ),
                        ForgotForm(
                          onResetPasswordTap: () => _goTo(3),
                          onLoginTap: () => _goTo(0),
                        ),
                        ResetForm(
                          onLoginTap: () => _goTo(0),
                          onForgotTap: () => _goTo(2),
                        ),
                      ],
                    )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class AuthNavigator extends StatefulWidget {
//   const AuthNavigator({super.key});
//
//   @override
//   State<AuthNavigator> createState() => _AuthNavigatorState();
// }
//
// class _AuthNavigatorState extends State<AuthNavigator> {
//   final GlobalKey<NavigatorState> _authNavKey = GlobalKey<NavigatorState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//       key: _authNavKey,
//       initialRoute: '/login',
//       onGenerateRoute: (RouteSettings settings) {
//         Widget page;
//         switch (settings.name) {
//           case '/login':
//             page = LoginForm(
//               createAccount: () =>
//                   _authNavKey.currentState!.pushReplacementNamed('/register'),
//               forgotTap: () =>
//                   _authNavKey.currentState!.pushReplacementNamed('/forgot'),
//             );
//           case '/register':
//             page = RegisterForm(
//               onLoginTap: () =>
//                   _authNavKey.currentState!.pushReplacementNamed('/login'),
//             );
//           case '/forgot':
//             page = ForgotForm(
//               onResetPasswordTap: () =>
//                   _authNavKey.currentState!.pushReplacementNamed('/reset'),
//               onLoginTap: () =>
//                   _authNavKey.currentState!.pushReplacementNamed('/login'),
//             );
//           case '/reset':
//             page = ResetForm(
//               onLoginTap: () =>
//                   _authNavKey.currentState!.pushReplacementNamed('/login'),
//               onForgotTap: () =>
//                   _authNavKey.currentState!.pushReplacementNamed('/forgot'),
//             );
//           default:
//             page = LoginForm(
//               createAccount: () =>
//                   _authNavKey.currentState!.pushReplacementNamed('/register'),
//               forgotTap: () =>
//                   _authNavKey.currentState!.pushReplacementNamed('/forgot'),
//             );
//         }
//         return MaterialPageRoute(builder: (_) => page, settings: settings);
//       },
//     );
//   }
// }
