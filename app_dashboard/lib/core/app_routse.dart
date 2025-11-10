import 'package:app_dashboard/app/di.dart';
import 'package:app_dashboard/featuers/authentication/ui/auth_screen.dart';
import 'package:app_dashboard/featuers/authentication/ui/logic/controller/auth_admin_cubit.dart';
import 'package:app_dashboard/featuers/categories/ui/logic/controller/cubit.dart';

import 'package:app_dashboard/featuers/dashboard/ui/logic/controller/cubit.dart';
import 'package:app_dashboard/featuers/root/ui/logic/controller/cubit.dart';
import 'package:app_dashboard/featuers/stories/ui/logic/controller/cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../featuers/root/ui/root_screen.dart';

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
        BlocProvider(create: (_) => getIt<RootCubit>()),
        BlocProvider(create: (_) => getIt<DashboardCubit>()),
        BlocProvider(create: (_) => getIt<CategoriesCubit>()),
        BlocProvider(create: (_) => getIt<StoriesCubit>()),
      ],
      child: const RootScreen(),

    ),
  };
}
