import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collections_edit.dart/blocs/collections_edit_bloc/edit_bloc.dart';
import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collections_edit.dart/blocs/cubit_image_edit/get_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../repositories/collections_repositories.dart';
import '../../../../../utils/constants.dart';

class SubTitleCollectionEdit extends StatelessWidget {
  const SubTitleCollectionEdit({
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

  void _updateCollection(
    BuildContext context,
    state,
    stateImage,
  ) {
    CollectionsRepositories.instance.updateCollection(
      idCollection,
      state.title ?? titleCollection,
      state.subTitle ?? subTitleCollection,
      stateImage.image ?? imageCollection,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionEditBloc, CollectionEditState>(
      builder: (_, state) {
        return Column(
          children: [
            const SizedBox(
              height: 15.0,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 28.0,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Введите описание...',
                  style: twoBodyTextStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: TextField(
                maxLines: 3,
                onChanged: (subTitle) {
                  context.read<CollectionEditBloc>().add(
                        CollectionEditEvent(
                          subTitle: subTitle,
                        ),
                      );
                },
                style: const TextStyle(
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            BlocBuilder<GetImageCubit, GetImageState>(
              builder: (_, stateImage) {
                return Padding(
                  padding: const EdgeInsets.only(
                    right: 10.0,
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        _updateCollection(
                          context,
                          state,
                          stateImage,
                        );

                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Готово',
                        style: kLinkColorText,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
