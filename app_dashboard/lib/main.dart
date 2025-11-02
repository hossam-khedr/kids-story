import 'package:app_dashboard/app/di.dart';
import 'package:app_dashboard/app/entry_point.dart';
import 'package:flutter/material.dart';
import 'package:shared/core/network/dio_client.dart';
import 'package:shared/utils/helpers/cache_helper.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  CacheHelper.initCacheHelper();
  await setUpCategories();
  await setUpStories();
  await setupAuthAdmin();
  await setupDashboard();
  runApp( const EntryPoint());
}




