import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collection_item_edit_audio/widgets/appbar_collections_edit_audio.dart';
import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collection_item_edit_audio/widgets/list_collection_edit.dart';
import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collection_item_edit_audio/widgets/photo_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/list_item_block/list_item_block.dart';

class CollectionItemEditAudioArguments {
  CollectionItemEditAudioArguments(
      this.idCollection,
      this.titleCollection,
      this.subTitleCollection,
      this.qualityCollection,
      this.imageCollection,
      this.dataCollection,
      this.totalTimeCollection);

  final String idCollection;
  final String titleCollection;
  final String subTitleCollection;
  final String qualityCollection;
  final String imageCollection;
  final String dataCollection;
  final String totalTimeCollection;
}

class CollectionItemEditAudio extends StatelessWidget {
  const CollectionItemEditAudio({
    Key? key,
    required this.idCollection,
    required this.titleCollection,
    required this.subTitleCollection,
    required this.qualityCollection,
    required this.imageCollection,
    required this.dataCollection,
    required this.totalTimeCollection,
  }) : super(key: key);
  final String idCollection;
  final String titleCollection;
  final String subTitleCollection;
  final String qualityCollection;
  final String imageCollection;
  final String dataCollection;
  final String totalTimeCollection;
  static const routeName = '/collection_item_edit_audio';

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider<ListItemBloc>(
      create: (context) => ListItemBloc()
        ..add(
          LoadListItemEvent(
            sort: 'all',
            collection: 'Collections',
            nameSort: 'collections',
          ),
        ),
      child: Scaffold(
        body: SizedBox(
          height: screenHeight - kBottomNavigationBarHeight,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        AppbarHeaderCollectionItemEditAudio(
                          subTitleCollection: subTitleCollection,
                          idCollection: idCollection,
                          titleCollection: titleCollection,
                        ),
                        PhotoContainerCollectionItemEditAudio(
                          dataCollection: dataCollection,
                          imageCollection: imageCollection,
                          totalTimeCollection: totalTimeCollection,
                          qualityCollection: qualityCollection,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListCollectionItemEditAudio(
                      idCollection: idCollection,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
