import 'package:audio_fairy_tales/blocs/list_item_block/list_item_block.dart';
import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collection_item/bloc/collection_item_bloc.dart';
import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collection_item/widgets/appbar_collection_edit.dart';
import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collection_item/widgets/list_collection_edit.dart';
import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collection_item/widgets/photo_container_edit_collection_page.dart';
import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collection_item/widgets/sub_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/player_widgets/player_collections.dart';

class CollectionsItemPageArguments {
  CollectionsItemPageArguments(
    this.idCollection,
    this.titleCollection,
    this.subTitleCollection,
    this.qualityCollection,
    this.imageCollection,
    this.dataCollection,
    this.totalTimeCollection,
  );
  final String idCollection;
  final String titleCollection;
  final String subTitleCollection;
  final String qualityCollection;
  final String imageCollection;
  final String dataCollection;
  final String totalTimeCollection;
}

class CollectionsItemPage extends StatelessWidget {
  const CollectionsItemPage({
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
  static const routeName = '/collections_item_page';

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWight = MediaQuery.of(context).size.width;
    return MultiBlocProvider(
      providers: [
        BlocProvider<CollectionItemAnimBloc>(
          create: (context) => CollectionItemAnimBloc(),
        ),
        BlocProvider<ListItemBloc>(
          create: (context) => ListItemBloc()
            ..add(
              LoadListItemEvent(
                sort: idCollection,
                collection: 'Collections',
                nameSort: 'collections',
              ),
            ),
        ),
      ],
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
                        AppbarHeaderCollectionItem(
                          totalTimeCollection: totalTimeCollection,
                          qualityCollection: qualityCollection,
                          dataCollection: dataCollection,
                          imageCollection: imageCollection,
                          titleCollection: titleCollection,
                          subTitleCollection: subTitleCollection,
                          idCollection: idCollection,
                        ),
                        PhotoContainer(
                          totalTimeCollection: totalTimeCollection,
                          dataCollection: dataCollection,
                          qualityCollection: qualityCollection,
                          imageCollection: imageCollection,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        SubTitle(
                          subTitleCollection: subTitleCollection,
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 2,
                          child: ListCollectionsAudio(
                            idCollection: idCollection,
                            imageCollection: imageCollection,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              BlocBuilder<CollectionItemAnimBloc, CollectionItemAnimState>(
                builder: (_, state) {
                  return PlayerCollections(
                    screenWight: screenWight,
                    screenHeight: screenHeight,
                    idCollection: idCollection,
                    animation: state.anim,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
