import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../widgets/player_widgets/player_mini_sellections.dart';
import '../bloc/add_audio_bloc.dart';

class ListPlayersCollectionAddAudio extends StatelessWidget {
  const ListPlayersCollectionAddAudio(
      {Key? key, required this.titleCollections})
      : super(key: key);
  final String titleCollections;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: screenHeight - (kBottomNavigationBarHeight),
          child: BlocBuilder<CollectionAddAudioBloc, CollectionAddAudioState>(
            builder: (context, state) {
              if (state.status == CollectionAddAudioStatus.initial) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state.status == CollectionAddAudioStatus.success) {
                return ListView.builder(
                  padding: const EdgeInsets.only(
                    top: 230.0,
                  ),
                  itemCount: state.list.length,
                  itemBuilder: (BuildContext context, int index) {
                    final audio = state.list[index];
                    return PlayerMiniPodborki(
                      duration: '${audio.duration}',
                      url: '${audio.audioUrl}',
                      name: '${audio.audioName}',
                      done: audio.done = false,
                      id: '${audio.id}',
                      collection: audio.collections ?? [],
                      titleCollections: titleCollections,
                    );
                  },
                );
              }
              if (state.status == CollectionAddAudioStatus.failed) {
                return const Center(
                  child: Text(
                    'Ой: сталася помилка!',
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
