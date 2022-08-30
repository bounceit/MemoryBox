import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collections_edit_pages/collections_edit_model.dart';
import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collections_repository.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../custom_shape.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/buttons/icon_back.dart';

class AppbarHeaderEdit extends StatelessWidget {
  const AppbarHeaderEdit({
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
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconBack(
                onPressed: () {
                  Navigator.pop(context);
                  CollectionsRepositories()
                      .deleteCollection(idCollection, 'CollectionsTale');
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Создание',
                  style: twoTitleTextStyle,
                ),
              ),
              TextButton(
                  onPressed: () {
                    _updateCollection(context);

                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Готово',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white100),
                  ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 90.0, left: 15.0, right: 15.0),
          child: TextField(
            onChanged: (title) {
              context.read<CollectionsEditModel>().userTitle(title);
            },
            style: const TextStyle(
              fontSize: 24.0,
              color: AppColors.white100,
              fontWeight: FontWeight.w700,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Название',
              hintStyle: TextStyle(fontSize: 24.0, color: AppColors.white100),
            ),
          ),
        ),
      ],
    );
  }
}
