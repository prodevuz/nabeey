import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabeey/utils/constants/sizes.dart';
import 'package:nabeey/common/widgets/header/header.dart';
import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:nabeey/features/explore/models/category_model.dart';
import 'package:nabeey/features/explore/blocs/audio/audio_bloc.dart';
import 'package:nabeey/features/explore/blocs/audio/audio_event.dart';
import 'package:nabeey/features/explore/blocs/audio/audio_state.dart';
import 'package:nabeey/features/explore/screens/audio/widgets/audio_item.dart';
import 'package:nabeey/features/explore/cubits/audio/audio_playback_cubit.dart';

class AudioScreen extends StatelessWidget {
  const AudioScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<AudioBloc>(context);
    controller.add(LoadAudios());

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (value, _) => controller.playingAudio = null,
      child: Scaffold(
        body: BlocBuilder<AudioBloc, AudioState>(
          builder: (context, state) {
            if (state is AudioLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AudioLoaded) {
              final audios = state.audios;

              return Column(
                children: [
                  /// Category Description
                  ADHeader(category: category),

                  /// Audios
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: ADSizes.defaultSpace,
                        left: ADSizes.defaultSpace,
                        right: ADSizes.defaultSpace,
                      ),
                      child: ExpansionTileGroup(
                        spaceBetweenItem: ADSizes.spaceBtwItems,
                        toggleType: ToggleType.expandOnlyCurrent,
                        children: audios
                            .map(
                              (audio) => ExpansionTileItem(
                                maintainState: true,
                                isHasTrailing: false,
                                isHasTopBorder: false,
                                isHasBottomBorder: false,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(width: 1, color: Colors.grey, style: BorderStyle.solid),
                                title: Center(child: Text(audio.title, style: Theme.of(context).textTheme.titleLarge)),
                                children: [
                                  BlocProvider(
                                    create: (_) => AudioPlaybackCubit(audioController: controller),
                                    child: AudioItem(audio: audio),
                                  )
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is AudioEmpty) {
              return Center(child: Padding(padding: const EdgeInsets.all(ADSizes.defaultSpace), child: Text("Maqola mavjud emas.", style: Theme.of(context).textTheme.bodyLarge)));
            } else if (state is AudioError) {
              return Center(child: Padding(padding: const EdgeInsets.all(ADSizes.defaultSpace), child: Text(state.message, style: Theme.of(context).textTheme.bodyLarge)));
            } else {
              return Center(child: Padding(padding: const EdgeInsets.all(ADSizes.defaultSpace), child: Text("Nimadir xato ketdi.", style: Theme.of(context).textTheme.bodyLarge)));
            }
          },
        ),
      ),
    );
  }
}
