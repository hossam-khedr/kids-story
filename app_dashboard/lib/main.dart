import 'package:app_dashboard/app/di.dart';
import 'package:app_dashboard/app/entry_point.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:shared/core/network/dio_client.dart';
import 'package:shared/utils/helpers/cache_helper.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  CacheHelper.initCacheHelper();
  await Jiffy.setLocale('ar_EG');
  await setupAuthAdmin();
  await setupDashboard();
  await setupCategories();
  await setupStories();
  runApp( const EntryPoint());
}




