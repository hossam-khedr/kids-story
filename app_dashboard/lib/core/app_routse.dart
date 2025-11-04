import 'package:app_dashboard/app/di.dart';
import 'package:app_dashboard/featuers/authentication/ui/auth_screen.dart';
import 'package:app_dashboard/featuers/authentication/ui/logic/controller/auth_admin_cubit.dart';
import 'package:app_dashboard/featuers/categories/ui/logic/controller/cubit.dart';

import 'package:app_dashboard/featuers/dashboard/ui/logic/controller/cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../featuers/root/root_screen.dart';

class AppRoutes {
  static const String auth = '/';
  static const String root = '/root';

  static Map<String, Widget Function(BuildContext context)> buildRoutes = {
    auth: (context) => BlocProvider(
      create: (_) => getIt<AuthAdminCubit>(),
      child: const AuthScreen(),
    ),
    root: (context) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<DashboardCubit>()),
        BlocProvider(create: (_) => getIt<CategoriesCubit>()),
      ],
      child: const RootScreen(),

    ),
  };
}
