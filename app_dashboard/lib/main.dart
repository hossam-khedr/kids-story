import 'package:app_dashboard/app/di.dart';
import 'package:app_dashboard/app/entry_point.dart';
import 'package:flutter/material.dart';
import 'package:shared/core/network/dio_client.dart';
import 'package:shared/utils/helpers/widgets/base_cubit_wrapper.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await setUpCategories();
  await setUpStories();
  runApp( EntryPoint());
}




