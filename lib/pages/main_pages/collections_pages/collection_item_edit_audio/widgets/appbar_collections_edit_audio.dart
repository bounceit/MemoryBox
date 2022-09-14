import 'package:audio_fairy_tales/custom_shape.dart';
import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collection_item_edit_audio/widgets/popup_menu_edit_audio.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:audio_fairy_tales/widgets/buttons/icon_back.dart';
import 'package:flutter/material.dart';

import '../../../../../repositories/collections_repositories.dart';
import '../../collections/collections.dart';

class AppbarHeaderCollectionItemEditAudio extends StatelessWidget {
  const AppbarHeaderCollectionItemEditAudio({
    Key? key,
    required this.idCollection,
    required this.titleCollection,
    required this.subTitleCollection,
  }) : super(key: key);
  final String idCollection;
  final String titleCollection;
  final String subTitleCollection;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: Customshape(),
          child: Container(
            color: AppColors.colorAppbar2,
            width: double.infinity,
            height: 280.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 30.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconBack(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Collections.routeName,
                  );
                  CollectionsRepositories.instance
                      .updateQualityAndTotalTime(idCollection);
                },
              ),
              PopupMenuCollectionItemEditAudioPage(
                titleCollection: titleCollection,
                subTitleCollection: subTitleCollection,
                idCollection: idCollection,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 90.0,
            left: 15.0,
            right: 15.0,
          ),
          child: Text(
            titleCollection,
            style: const TextStyle(
              fontSize: 24.0,
              color: AppColors.white100,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
