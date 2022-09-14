import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collections_edit.dart/blocs/collections_edit_bloc/edit_bloc.dart';
import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collections_edit.dart/blocs/cubit_image_edit/get_image_cubit.dart';
import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collections_edit.dart/widgets/appbar_edit.dart';
import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collections_edit.dart/widgets/button_add_audio.dart';
import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collections_edit.dart/widgets/photo_container.dart';
import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collections_edit.dart/widgets/subtitle_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollectionsEditArguments {
  CollectionsEditArguments({
    this.idCollection,
    this.titleCollection,
    this.subTitleCollection,
    this.imageCollection,
  });

  final String? idCollection;
  final String? titleCollection;
  final String? subTitleCollection;
  final String? imageCollection;
}

class CollectionsEdit extends StatelessWidget {
  const CollectionsEdit({
    Key? key,
    required this.idCollection,
    required this.titleCollection,
    required this.subTitleCollection,
    required this.imageCollection,
  }) : super(key: key);
  final String idCollection;
  final String titleCollection;
  final String subTitleCollection;
  final String imageCollection;
  static const routeName = 'collection_edit_dmjmkjj';

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return MultiBlocProvider(
      providers: [
        BlocProvider<CollectionEditBloc>(
          create: (context) => CollectionEditBloc(),
        ),
        BlocProvider<GetImageCubit>(
          create: (context) => GetImageCubit(),
        ),
      ],
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      AppbarHeaderEdit(
                        subTitleCollection: subTitleCollection,
                        imageCollection: imageCollection,
                        titleCollection: titleCollection,
                        idCollection: idCollection,
                      ),
                      const PhotoContainer(),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubTitleCollectionEdit(
                        subTitleCollection: subTitleCollection,
                        imageCollection: imageCollection,
                        titleCollection: titleCollection,
                        idCollection: idCollection,
                      ),
                      ButtonAddAudio(
                        subTitleCollection: subTitleCollection,
                        idCollection: idCollection,
                        imageCollection: imageCollection,
                        titleCollection: titleCollection,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
