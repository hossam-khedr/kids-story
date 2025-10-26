import 'package:app_dashboard/featuers/stories/ui/logic/cubit.dart';
import 'package:app_dashboard/featuers/stories/ui/logic/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/core/constants/app_colors.dart';
import 'package:shared/utils/toast_service.dart';

import 'delete_or_update_story.dart';

class DeleteStory extends StatelessWidget {
  final void Function()? onDelete;

  const DeleteStory({super.key, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<StoriesCubit>(context),
      child: BlocConsumer<StoriesCubit, StoriesStates>(
        listener: (context, state) {
          if (state.isDeleteError) {
            ToastService.error(context, state.errorMessage);
          }
          if (state.isDeleteSuccess) {
            ToastService.success(context, 'Story Deleted Successfully');
          }
        },
        builder: (context, state) {
          return Expanded(
            child: InkWell(
              onTap: onDelete,
              child: state.isDeleteLoading
                  ? Center(child: CircularProgressIndicator())
                  : DeleteOrUpdateStory(
                      color: AppColors.red,
                      icon: Icons.delete_forever_outlined,
                      iconColor: AppColors.red,
                      text: 'Delete',
                      textColor: AppColors.red,
                    ),
            ),
          );
        },
      ),
    );
  }
}
