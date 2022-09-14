import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collections_add_audio/collections_add_audio.dart';
import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collections_edit.dart/blocs/cubit_image_edit/get_image_cubit.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:audio_fairy_tales/repositories/collections_repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/collections_edit_bloc/edit_bloc.dart';

class ButtonAddAudio extends StatelessWidget {
  const ButtonAddAudio({
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

  void _addAudioInCollection(
    BuildContext context,
    state,
    stateImage,
  ) {
    final title = state.title ?? titleCollection;
    CollectionsRepositories.instance.updateCollection(
      idCollection,
      state.title ?? titleCollection,
      state.subTitle ?? subTitleCollection,
      stateImage.image ?? imageCollection,
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return CollectionsAddAudio(
          titleCollections: title,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionEditBloc, CollectionEditState>(
      builder: (_, state) {
        return BlocBuilder<GetImageCubit, GetImageState>(
          builder: (_, stateImage) {
            return TextButton(
              onPressed: () => _addAudioInCollection(
                context,
                state,
                stateImage,
              ),
              child: const Center(
                child: Text(
                  'Добавить аудиофайл',
                  style: TextStyle(
                    color: AppColors.colorText80,
                    fontSize: 14.0,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
