import 'dart:async';

import 'package:audio_fairy_tales/pages/drawer_pages/search_page/search_page_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/audio_model.dart';
import '../../../../repositories/audio_firebase_repositories.dart';
import '../../../../widgets/buttons/alert_dialog.dart';
import '../../../../widgets/buttons/popup_menu_item.dart';
import '../../../../widgets/player_widgets/player_mini.dart';
import '../../../save_pages/save_page.dart';

class ListPlayersSearchPage extends StatelessWidget {
  ListPlayersSearchPage({Key? key}) : super(key: key);
  final AudioRepositories _rep = AudioRepositories();
  Stream<List<AudioModel>> audio(BuildContext context) => FirebaseFirestore
      .instance
      .collection(_rep.user!.phoneNumber!)
      .doc('id')
      .collection('Collections')
      .where('searchName',
          arrayContains: context.watch<SearchPageModel>().getSearchData)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => AudioModel.fromJson(doc.data())).toList());

  Widget buildAudio(AudioModel audio) => PlayerMini(
        duration: '${audio.duration}',
        url: '${audio.audioUrl}',
        name: '${audio.audioName}',
        done: audio.done!,
        id: '${audio.id}',
        collection: audio.collections ?? [],
        popupMenu: _PopupMenuAudioSearchPage(
          url: '${audio.audioUrl}',
          duration: '${audio.duration}',
          name: '${audio.audioName}',
          image: '',
          searchName: audio.searchName ?? [],
          dateTime: audio.dateTime!,
          collection: audio.collections ?? [],
          idAudio: audio.id!,
          done: audio.done ?? false,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SearchPageModel>().getSearchData;
    final double screenHeight = MediaQuery.of(context).size.height;
    if (state == '') {
      return Column(
        children: [
          SizedBox(
            height: screenHeight * 0.95,
            child: StreamBuilder<List<AudioModel>>(
              stream: _rep.readAudioSort('all'),
              builder: (
                context,
                snapshot,
              ) {
                if (snapshot.hasError) {
                  return const Text('Ошибка');
                }
                if (snapshot.hasData) {
                  final audio = snapshot.data!;
                  return ListView(
                    padding: const EdgeInsets.only(top: 165, bottom: 110),
                    children: audio.map(buildAudio).toList(),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          SizedBox(
            height: screenHeight * 0.95,
            child: StreamBuilder<List<AudioModel>>(
              stream: audio(context),
              builder: (
                context,
                snapshot,
              ) {
                if (snapshot.hasError) {
                  return const Text('Ошибка');
                }
                if (snapshot.hasData) {
                  final audio = snapshot.data!;
                  return ListView(
                    padding: const EdgeInsets.only(top: 165, bottom: 110),
                    children: audio.map(buildAudio).toList(),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      );
    }
  }
}

class _PopupMenuAudioSearchPage extends StatelessWidget {
  _PopupMenuAudioSearchPage({
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
  final String image;
  final String url;
  final String duration;
  final String name;
  final bool done;
  final String dateTime;
  final List searchName;
  final String idAudio;
  final List collection;
  final AudioRepositories _rep = AudioRepositories();

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

  void _addInCollection(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      // context
      //     .read<CollectionAddAudioInCollectionModel>()
      //     .setCollectionAudio(collection);
      // context.read<CollectionAddAudioInCollectionModel>().setIdAudio(idAudio);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Container();
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
          () => _addInCollection(context),
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
        popupMenuItem(
          'Поделиться',
          () => _rep.downloadAudio(idAudio, name),
        ),
      ],
    );
  }
}
