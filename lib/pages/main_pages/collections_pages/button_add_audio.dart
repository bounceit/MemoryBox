import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collections_edit_model.dart';
import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collections_repository.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  void _addAudioInCollection(BuildContext context, String title) {
    CollectionsRepositories().updateCollection(
        idCollection,
        Provider.of<CollectionsEditModel>(context, listen: false).getTitle ??
            titleCollection,
        Provider.of<CollectionsEditModel>(context, listen: false).getSubTitle ??
            subTitleCollection,
        Provider.of<CollectionsEditModel>(context, listen: false).getImage ??
            imageCollection);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Container();
    }));
  }
// 
  @override
  Widget build(BuildContext context) {
    final title =
        Provider.of<CollectionsEditModel>(context, listen: false).getTitle ??
            titleCollection;
    return TextButton(
        onPressed: () => _addAudioInCollection(context, title),
        child: const Center(
          child: Text(
            'Добавить аудиофайл',
            style: TextStyle(
              color: AppColors.colorText80,
              fontSize: 14.0,
              decoration: TextDecoration.underline,
            ),
          ),
        ));
  }
}
