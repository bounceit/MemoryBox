import 'package:audio_fairy_tales/pages/main_pages/collections_pages/add_audio_in_collection/widgets/model_add_collection_audio.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/audio_collection_add_bloc.dart';

class ListCollectionAddAudioInCollection extends StatelessWidget {
  const ListCollectionAddAudioInCollection({
    Key? key,
    required this.collectionAudio,
    required this.idAudio,
  }) : super(key: key);
  final List collectionAudio;
  final String idAudio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 90.0,
      ),
      child: BlocBuilder<ListCollectionAddAudioInCollectionBloc,
          ListCollectionAddAudioInCollectionState>(
        builder: (context, state) {
          if (state.status ==
              ListCollectionAddAudioInCollectionStatus.initial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status ==
              ListCollectionAddAudioInCollectionStatus.emptyList) {
            return const Center(
              child: Text(
                'Сперва Вам нужно \n создать подборку',
                style: TextStyle(
                  fontSize: 20.0,
                  color: AppColors.colorText50,
                ),
              ),
            );
          }
          if (state.status ==
              ListCollectionAddAudioInCollectionStatus.success) {
            return GridView.builder(
              primary: false,
              padding: const EdgeInsets.all(20.0),
              itemCount: state.list.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                crossAxisCount: 2,
                childAspectRatio: 0.76,
              ),
              itemBuilder: (BuildContext context, int index) {
                final collections = state.list[index];
                return ModelAudioCollectionAddAudioInCollection(
                  id: '${collections.id}',
                  image: '${collections.avatarCollections}',
                  title: '${collections.titleCollections}',
                  subTitle: '${collections.subTitleCollections}',
                  data: '${collections.dateTime}',
                  quality: '${collections.qualityCollections}',
                  doneCollection: collections.doneCollection,
                  totalTime: '${collections.totalTime}',
                  idAudio: idAudio,
                  collectionAudio: collectionAudio,
                );
              },
            );
          }
          if (state.status == ListCollectionAddAudioInCollectionStatus.failed) {
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
    );
  }
}
