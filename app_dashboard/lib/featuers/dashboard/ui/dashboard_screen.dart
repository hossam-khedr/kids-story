import 'package:app_dashboard/app/di.dart';
import 'package:app_dashboard/app/responsive_helper.dart';
import 'package:app_dashboard/core/dashboard_color.dart';
import 'package:app_dashboard/core/space_widget.dart';
import 'package:app_dashboard/core/svg_icon.dart';
import 'package:app_dashboard/featuers/dashboard/ui/logic/controller/cubit.dart';
import 'package:app_dashboard/featuers/dashboard/ui/logic/controller/stats.dart';
import 'package:app_dashboard/featuers/dashboard/ui/widgets/add_item.dart';
import 'package:app_dashboard/featuers/dashboard/ui/widgets/create_category.dart';
import 'package:app_dashboard/featuers/dashboard/ui/widgets/create_story.dart';
import 'package:app_dashboard/featuers/dashboard/ui/widgets/dashboard_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';

import '../../../core/widgets/custom_circle_progress.dart';

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
      padding: EdgeInsets.all(context.responsive.spacingS),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            data: 'مرحباً بك في لوحة التحكم',
            style: TextStyle(
              color: DashboardColors.darkGray,
              fontSize: context.responsive.isMobile?12:14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Space(space: context.responsive.screenHeight * 0.02),
          AppText(
            data: 'إدارة قصص الأطفال والتصنيفات بسهولة',
            style: TextStyle(
              color: DashboardColors.darkGray,
              fontSize: context.responsive.isMobile?10:12,
              fontWeight: FontWeight.w200,
            ),
          ),
          Space(space: context.responsive.screenHeight * 0.06),
          BlocProvider.value(
            value: BlocProvider.of<DashboardCubit>(context),
            child: BlocBuilder<DashboardCubit, DashboardStats>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CustomCircleProgress(
                      color: DashboardColors.pink,
                      size: 40,
                    ),
                  );
                }
                if (state.isError) {
                  return Center(child: AppText(data: state.errorMessage));
                }
                if (state.isSuccess) {
                return  context.responsive.isMobile?
                    Expanded(
                      child: Column(
                        spacing: context.responsive.screenHeight * 0.01,
                        children: [
                          Expanded(
                            child: DashboardInfoCard(
                              title: 'إجمالي التصنيفات',
                              counter: state
                                  .statisticsResponse!
                                  .contentStatsResponse
                                  .totalCategories
                                  .toString(),
                              cardColor: DashboardColors.pink,
                              icon: SvgIcons.folder,
                            ),
                          ),
                          Expanded(
                            child: DashboardInfoCard(
                              title: 'إجمالي القصص',
                              counter: state
                                  .statisticsResponse!
                                  .contentStatsResponse
                                  .totalStories
                                  .toString(),
                              cardColor: DashboardColors.blue,
                              icon: SvgIcons.book,
                            ),
                          ),
                          Expanded(
                            child: DashboardInfoCard(
                              title: 'المستخدمين النشطين',
                              counter: state
                                  .statisticsResponse!
                                  .userStatsResponse
                                  .total
                                  .toString(),
                              cardColor: DashboardColors.purble,
                              icon: SvgIcons.user,
                            ),
                          ),
                        ],
                      ),
                    ) :
                   Row(
                    spacing: context.responsive.screenWidth * 0.01,
                    children: [
                      Expanded(
                        child: DashboardInfoCard(
                          title: 'إجمالي التصنيفات',
                          counter: state
                              .statisticsResponse!
                              .contentStatsResponse
                              .totalCategories
                              .toString(),
                          cardColor: DashboardColors.pink,
                          icon: SvgIcons.folder,
                        ),
                      ),
                      Expanded(
                        child: DashboardInfoCard(
                          title: 'إجمالي القصص',
                          counter: state
                              .statisticsResponse!
                              .contentStatsResponse
                              .totalStories
                              .toString(),
                          cardColor: DashboardColors.blue,
                          icon: SvgIcons.book,
                        ),
                      ),
                      Expanded(
                        child: DashboardInfoCard(
                          title: 'المستخدمين النشطين',
                          counter: state
                              .statisticsResponse!
                              .userStatsResponse
                              .total
                              .toString(),
                          cardColor: DashboardColors.purble,
                          icon: SvgIcons.user,
                        ),
                      ),
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
          Space(space: context.responsive.screenHeight * 0.05),
          Card(
            margin: EdgeInsets.zero,
            color: DashboardColors.whait,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: context.responsive.spacingM,
                horizontal: context.responsive.spacingS,
              ),
              child: Column(
                spacing: context.responsive.screenHeight * 0.03,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    data: 'الإجراءات السريعة',
                    style: TextStyle(
                      color: DashboardColors.darkGray,
                      fontSize: context.responsive.isMobile?10:12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    spacing: context.responsive.screenWidth * 0.01,
                    children: [
                      Expanded(
                        child: AddItem(
                          onTap: () => showDialog(
                            context: context,
                            builder: (context) => BlocProvider.value(
                              value: getIt<DashboardCubit>(),
                              child: const CreateCategory(),
                            ),
                          ),

                          color: DashboardColors.lightPink,
                          buttonColor: DashboardColors.pink,
                          title: 'اضافة تصنيف جديد',
                          subTitle: 'انشاء تصنيف جديد للقصص',
                        ),
                      ),
                      Expanded(
                        child: AddItem(
                          onTap: () => showDialog(
                            context: context,
                            builder: (context) => BlocProvider.value(
                              value: getIt<DashboardCubit>(),
                              child: const CreateStory(),
                            ),
                          ),
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
