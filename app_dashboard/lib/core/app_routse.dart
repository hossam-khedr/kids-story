import 'package:app_dashboard/app/di.dart';
import 'package:app_dashboard/featuers/authentication/ui/auth_screen.dart';
import 'package:app_dashboard/featuers/authentication/ui/logic/controller/auth_admin_cubit.dart';
import 'package:app_dashboard/featuers/categories/ui/logic/controller/cubit.dart';
import 'package:app_dashboard/featuers/categories/ui/screens/add_category_screen.dart';
import 'package:app_dashboard/featuers/dashboard/ui/logic/controller/cubit.dart';
import 'package:app_dashboard/featuers/home/ui/home_screen.dart';
import 'package:app_dashboard/featuers/root/root_screen.dart';
import 'package:app_dashboard/featuers/stories/ui/logic/cubit.dart';
import 'package:app_dashboard/featuers/stories/ui/screens/add_story_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static const String auth = '/';
  static const String home = '/home';
  static const String root = '/root';
  static const String addCategory = '/addCategory';
  static const String addStory = '/addStory';

  static Map<String, Widget Function(BuildContext context)> buildRoutes = {
    auth: (context) => BlocProvider(
      create: (_) => getIt<AuthAdminCubit>(),
      child: const AuthScreen(),
    ),
    root: (context) => BlocProvider(
      child: const RootScreen(),
      create: (_) => getIt<DashboardCubit>(),
    ),
    home: (context) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (c) => getIt<CategoriesCubit>()),
        BlocProvider(create: (c) => getIt<StoriesCubit>()),
      ],
      child: const HomeScreen(),
    ),
    addCategory: (context) => const AddCategoryScreen(),
    addStory: (context) => BlocProvider(
      child: const AddStoryScreen(),
      create: (context) => getIt<StoriesCubit>(),
    ),
  };
}
