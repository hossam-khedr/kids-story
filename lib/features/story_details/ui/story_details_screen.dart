import 'package:flutter/material.dart';
import 'package:kids_story_ai/app/index.dart' hide State;
import 'package:kids_story_ai/core/widgets/full_screen_error.dart';
import 'package:kids_story_ai/core/widgets/full_screen_loading.dart';
import 'package:kids_story_ai/features/story_details/ui/logic/controller/cubit.dart';
import 'package:kids_story_ai/features/story_details/ui/logic/controller/states.dart';
import 'package:kids_story_ai/features/story_details/ui/widgets/story_details_data.dart';

class StoryDetailsScreen extends StatefulWidget {
  final int storyId;

  const StoryDetailsScreen({super.key, required this.storyId});

  @override
  State<StoryDetailsScreen> createState() => _StoryDetailsScreenState();
}

class _StoryDetailsScreenState extends State<StoryDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<StoryDetailsCubit>().getStoryByID(widget.storyId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<StoryDetailsCubit, StoryDetailsStates>(
        builder: (context, state) {
          if (state.isGetStoryLoading) {
            return const FullScreenLoading();
          }
          if (state.isGetStoryError) {
            return FullScreenError(
              message: state.errorMessage,
              onRetry: () => context.read<StoryDetailsCubit>().getStoryByID(
                widget.storyId,
              ),
            );
          }
          if (state.isGetStorySuccess ||
              state.isPlaySpeak ||
              state.isPauseSpeak) {
            return StoryDetailsData(
              image: state.data!.image,
              title: state.data!.title,
              content: state.data!.content,
              description: state.data!.description,
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
