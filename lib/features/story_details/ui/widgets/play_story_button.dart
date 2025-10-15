import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/helpers/responsive_helper.dart';
import '../../../../core/widgets/app_text.dart';
import '../logic/controller/cubit.dart';
import '../logic/controller/states.dart';

class PlayStoryButton extends StatelessWidget {
  final String content;
  const PlayStoryButton({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoryDetailsCubit,StoryDetailsStates>(
      builder: (context,state){
        return ElevatedButton(
          style: ButtonStyle(
            shape: WidgetStateProperty.all<OutlinedBorder?>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            backgroundColor: WidgetStateProperty.all(
              AppColors.primary,
            ),
          ),
          onPressed: (){
            if(!state.isSpeak){
              context.read<StoryDetailsCubit>().playSpeck(content);
            }else{
              context.read<StoryDetailsCubit>().pauseSpeck();
            }

          },
          child: Row(
            spacing: ResponsiveHelper.r.width(1),
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(state.isSpeak?Icons.pause_circle:Icons.play_circle,
                  color: AppColors.whit, size: 25),
              AppText(
                data:state.isSpeak?'ايقاف': 'استمع',
                style: TextStyle(
                  color: AppColors.whit,
                  fontSize: ResponsiveHelper.r.font(16),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },

    );
  }
}
