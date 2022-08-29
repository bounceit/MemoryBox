import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collections_edit_model.dart';
import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collections_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants.dart';

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

  void _updateCollection(BuildContext context) {
    CollectionsRepositories().updateCollection(
      idCollection,
      Provider.of<CollectionsEditModel>(context, listen: false).getTitle ??
          titleCollection,
      Provider.of<CollectionsEditModel>(context, listen: false).getSubTitle ??
          subTitleCollection,
      Provider.of<CollectionsEditModel>(context, listen: false).getImage ??
          imageCollection,
    );
  }

  @override
  Widget build(BuildContext context) {
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
              context.read<CollectionsEditModel>().userSubTitle(subTitle);
            },
            style: const TextStyle(
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 10.0,
          ),
          child: Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {
                _updateCollection(context);

                Navigator.pop(context);
              },
              child: const Text(
                'Готово',
                style: linkColorText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
