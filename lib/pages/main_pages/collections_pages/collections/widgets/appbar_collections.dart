import 'package:audio_fairy_tales/custom_shape.dart';
import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collections/widgets/popup_menu_collections.dart';
import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collections_edit.dart/collections_edit.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../../../repositories/collections_repositories.dart';
import '../../../../../utils/constants.dart';

class AppbarHeaderCollection extends StatelessWidget {
  const AppbarHeaderCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(),
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
            horizontal: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  var uuid = const Uuid();
                  var id = uuid.v1();
                  CollectionsRepositories.instance.addCollections(
                    'Без названия',
                    '...',
                    '',
                    id,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return CollectionsEdit(
                        idCollection: id,
                        titleCollection: 'Без названия',
                        subTitleCollection: '...',
                        imageCollection: '',
                      );
                    }),
                  );
                },
                icon: const Icon(
                  Icons.add,
                  size: 35.0,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Подборки',
                style: twoTitleTextStyle,
              ),
              PopupMenuCollectionPage(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 40.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Все в одном месте',
                style: twoTitleTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
