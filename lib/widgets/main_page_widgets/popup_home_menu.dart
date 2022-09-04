import 'dart:async';

import 'package:flutter/material.dart';

import '../../pages/save_pages/save_page.dart';
import '../../repositories/audio_firebase_repositories.dart';
import '../buttons/alert_dialog.dart';
import '../buttons/popup_menu_item.dart';

class PopupMenuHomePage extends StatelessWidget {
  PopupMenuHomePage({
    Key? key,
    required this.name,
    required this.url,
    required this.duration,
    required this.image,
    required this.done,
    required this.dateTime,
    required this.searchName,
    required this.idAudio,
    required this.collection,
  }) : super(key: key);
  final AudioRepositories _rep = AudioRepositories();
  final String name;
  final String url;
  final String duration;
  final String image;
  final bool done;
  final String dateTime;
  final List searchName;
  final String idAudio;
  final List collection;

  void _rename(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return SavePage(
          audioUrl: url,
          audioImage: image,
          audioDone: done,
          audioTime: dateTime,
          audioSearchName: searchName,
          audioCollection: collection,
          idAudio: idAudio,
          audioDuration: duration,
          audioName: name,
        );
      }));
    });
  }

  void _addInCollections(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      // context
      //     .read<CollectionAddAudioInCollectionModel>()
      //     .setCollectionAudio(collection);
      // context.read<CollectionAddAudioInCollectionModel>().setIdAudio(idAudio);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Container();
        // return CollectionAddAudioInCollection(
        //   collectionAudio: collection,
        //   idAudio: idAudio,
        // );
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(
        Icons.more_horiz,
      ),
      iconSize: 40,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      itemBuilder: (context) => [
        popupMenuItem(
          'Переименовать',
          () => _rename(context),
        ),
        popupMenuItem(
          'Добавить в подборку',
          () => _addInCollections(context),
        ),
        popupMenuItem(
          'Удалить ',
          () => AlertDialogApp().alertDialog(
            context,
            idAudio,
            'DeleteCollections',
            'Collections',
          ),
        ),
        popupMenuItem('Поделиться', () => _rep.downloadAudio(idAudio, name)),
      ],
    );
  }
}
