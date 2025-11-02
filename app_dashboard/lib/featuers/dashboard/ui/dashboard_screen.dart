import 'package:app_dashboard/core/dashboard_color.dart';
import 'package:app_dashboard/core/svg_icon.dart';
import 'package:app_dashboard/featuers/dashboard/ui/logic/controller/cubit.dart';
import 'package:app_dashboard/featuers/dashboard/ui/logic/controller/stats.dart';
import 'package:app_dashboard/featuers/dashboard/ui/widgets/add_item.dart';
import 'package:app_dashboard/featuers/dashboard/ui/widgets/dashboard_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardCubit>().getDashboardStats();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ResponsiveHelper.r.paddingAll(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            data: 'مرحباً بك في لوحة التحكم',
            style: TextStyle(
              color: DashboardColors.darkGray,
              fontSize: ResponsiveHelper.r.font(14),
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(ResponsiveHelper.r.height(2)),
          AppText(
            data: 'إدارة قصص الأطفال والتصنيفات بسهولة',
            style: TextStyle(
              color: DashboardColors.darkGray,
              fontSize: ResponsiveHelper.r.font(8),
              fontWeight: FontWeight.w200,
            ),
          ),
          Gap(ResponsiveHelper.r.height(6)),
          BlocProvider.value(
            value: BlocProvider.of<DashboardCubit>(context),
            child: BlocBuilder<DashboardCubit,DashboardStats>(
              builder: (context,state){
                if(state.isLoading){
                  return const Center(child: CircularProgressIndicator(),);
                }
                if(state.isError){
                  return Center(child: AppText(data: state.errorMessage),);
                }
                if(state.isSuccess){
                  return Row(
                    spacing: ResponsiveHelper.r.width(1.5),
                    children: [
                       Expanded(
                        child: DashboardInfoCard(
                          title: 'إجمالي التصنيفات',
                          counter:state.statisticsResponse!.contentStatsResponse.totalCategories.toString() ,
                          cardColor: DashboardColors.pink,
                          icon: SvgIcons.folder,
                        ),
                      ),
                       Expanded(
                        child: DashboardInfoCard(
                          title: 'إجمالي القصص',
                          counter: state.statisticsResponse!.contentStatsResponse.totalStories.toString(),
                          cardColor: DashboardColors.blue,
                          icon: SvgIcons.book,
                        ),
                      ),
                       Expanded(
                        child: DashboardInfoCard(
                          title: 'المستخدمين النشطين',
                          counter: state.statisticsResponse!.userStatsResponse.total.toString(),
                          cardColor: DashboardColors.purble,
                          icon: SvgIcons.user,
                        ),
                      ),
                    ],
                  );
                }else{
                  return const SizedBox.shrink();
                }
              },

            ),
          ),
          Gap(ResponsiveHelper.r.height(5)),
          Card(
            margin: EdgeInsets.zero,
            color: DashboardColors.whait,
            child: Padding(
              padding: ResponsiveHelper.r.paddingSymmetric(vertical: 20,horizontal: 15),
              child: Column(
                spacing: ResponsiveHelper.r.height(3),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    data: 'الإجراءات السريعة',
                    style: TextStyle(
                      color: DashboardColors.darkGray,
                      fontSize: ResponsiveHelper.r.font(10),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    spacing: ResponsiveHelper.r.width(1),
                    children: [
                      const Expanded(
                        child: AddItem(
                          color: DashboardColors.lightPink,
                          buttonColor: DashboardColors.pink,
                          title: 'اضافة تصنيف جديد',
                          subTitle: 'انشاء تصنيف جديد للقصص',
                        ),
                      ),
                      const Expanded(
                        child: AddItem(
                          color: DashboardColors.lightBlue,
                          buttonColor: DashboardColors.blue,
                          title: 'اضافة قصه جديد',
                          subTitle: 'انشاء قصه جديد للاطفال',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
