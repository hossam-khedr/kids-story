import 'package:app_dashboard/app/di.dart';
import 'package:app_dashboard/app/entry_point.dart';
import 'package:flutter/material.dart';
import 'package:shared/core/network/dio_client.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await setUpCategories();
  runApp(const EntryPoint());
}




