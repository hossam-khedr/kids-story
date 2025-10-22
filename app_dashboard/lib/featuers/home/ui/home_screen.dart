import 'package:app_dashboard/app/di.dart';
import 'package:app_dashboard/featuers/categories/ui/logic/controller/cubit.dart';
import 'package:app_dashboard/featuers/home/ui/widgets/home_app_bar.dart';
import 'package:app_dashboard/featuers/home/ui/widgets/search_bar.dart';
import 'package:app_dashboard/featuers/home/ui/widgets/side_mnue.dart';
import 'package:app_dashboard/featuers/home/ui/widgets/story_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/core/constants/app_colors.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

import '../../stories/ui/logic/cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>getIt<CategoriesCubit>()),
      ],
      child: Scaffold(
        body: Row(
          children: [
            SideMenu(),
            Expanded(
              flex: 4,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero
                ),
                margin: EdgeInsets.zero,
                color: AppColors.whit,
                child: Padding(
                  padding: ResponsiveHelper.r.paddingSymmetric(vertical: 10,horizontal: 20),
                  child: Column(
                    spacing: ResponsiveHelper.r.height(5),
                    children: [
                      HomeAppBar(),
                      CustomSearchBar(),
                      Expanded(
                        child: GridView.builder(
                          itemCount: 3,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 20,
                            ),
                            itemBuilder: (context,index){
                                return StoryItem();
                            }
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      
          ],
        ),
      ),
    );
  }
}
