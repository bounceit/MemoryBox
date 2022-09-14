import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collections_add_audio/widgets/appbar_add_audio.dart';
import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collections_add_audio/widgets/list_add_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/add_audio_bloc.dart';

class CollectionsAddAudioArguments {
  CollectionsAddAudioArguments({
    required this.titleCollections,
  });
  final String titleCollections;
}

class CollectionsAddAudio extends StatelessWidget {
  const CollectionsAddAudio({
    Key? key,
    required this.titleCollections,
  }) : super(key: key);
  static const routeName = '/collection_add_audio';
  final String titleCollections;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CollectionAddAudioBloc>(
          create: (context) => CollectionAddAudioBloc()
            ..add(
              const LoadCollectionAddAudioEvent(),
            ),
        ),
      ],
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ListPlayersCollectionAddAudio(
                    titleCollections: titleCollections,
                  ),
                  const AppbarHeaderCollectionAddAudio(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
