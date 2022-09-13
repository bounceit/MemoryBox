import 'package:audio_fairy_tales/pages/main_pages/collections_pages/add_audio_in_collection/bloc/audio_collection_add_bloc.dart';
import 'package:audio_fairy_tales/pages/main_pages/collections_pages/add_audio_in_collection/widgets/appbar_add_in_collection.dart';
import 'package:audio_fairy_tales/pages/main_pages/collections_pages/add_audio_in_collection/widgets/list_collection_add_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollectionAddAudioInCollectionArgument {
  CollectionAddAudioInCollectionArgument({
    required this.idAudio,
    required this.collectionAudio,
  });

  final List collectionAudio;
  final String idAudio;
}

class CollectionAddAudioInCollection extends StatelessWidget {
  const CollectionAddAudioInCollection({
    Key? key,
    required this.collectionAudio,
    required this.idAudio,
  }) : super(key: key);
  static const routeName = '/collection_add_audio_in_collection';
  final List collectionAudio;
  final String idAudio;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListCollectionAddAudioInCollectionBloc>(
      create: (context) => ListCollectionAddAudioInCollectionBloc()
        ..add(
          const LoadListCollectionAddAudioInCollectionEvent(),
        ),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              const AppbarHeaderCollectionAddAudioInCollection(),
              ListCollectionAddAudioInCollection(
                collectionAudio: collectionAudio,
                idAudio: idAudio,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
