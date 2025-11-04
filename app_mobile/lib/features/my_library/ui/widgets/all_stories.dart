import 'package:app_mobile/features/auth/ui/wdgets/auth_button.dart';
import 'package:app_mobile/features/my_library/ui/logic/controller/cubit.dart';
import 'package:app_mobile/features/my_library/ui/logic/controller/states.dart';
import 'package:app_mobile/features/my_library/ui/widgets/library_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shared/core/constants/app_colors.dart';
import 'package:shared/core/constants/app_strings.dart';
import 'package:shared/core/widgets/app_text.dart';
import 'package:shared/core/widgets/full_screen_error.dart';
import 'package:shared/core/widgets/full_screen_loading.dart';
import 'package:shared/utils/helpers/navigation_helper.dart';
import 'package:shared/utils/helpers/responsive_helper.dart';
import 'package:shared/core/widgets/custom_network_image.dart';

import '../../../../config/routes/app_routes.dart';

class AllStories extends StatelessWidget {
  const AllStories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryCubit, LibraryStates>(
      builder: (context, state) {
        if (state.isLoading) {
          return const SliverToBoxAdapter(
            child: FullScreenLoading(),
          );
        }

        if (state.isError) {
          return SliverToBoxAdapter(
            child: FullScreenError(
              message: state.errorMessage,
              onRetry: () =>
                  context.read<LibraryCubit>().getStoriesFromLibrary(),
            ),
          );
        }

        if (state.isSuccess) {
          return SliverPadding(
            padding: ResponsiveHelper.r.paddingSymmetric(horizontal: 12),
            sliver: SliverList.builder(
                 itemBuilder:  (context, index) {
                  return LibraryItem(response: state.response[index],
                    onTap:() =>NavigationHelper.pushNamed(
                    context,
                    AppRoutes.storyDetails,
                    arguments: state.response[index].id,
                  ),);
                },
                itemCount: state.response.length,

            ),
          );
        }

        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}

