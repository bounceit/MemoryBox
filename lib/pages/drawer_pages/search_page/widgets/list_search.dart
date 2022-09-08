import 'dart:async';

import 'package:audio_fairy_tales/pages/drawer_pages/search_page/search_page_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../models/audio_model.dart';
import '../../../../repositories/audio_firebase_repositories.dart';
import '../../../../widgets/buttons/alert_dialog.dart';
import '../../../../widgets/buttons/popup_menu_item.dart';
import '../../../../widgets/player_widgets/player_mini.dart';
import '../../../save_pages/save_page.dart';
import '../bloc/search_bloc.dart';

class ListPlayersSearchPage extends StatelessWidget {
  const ListPlayersSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: screenHeight - (kBottomNavigationBarHeight + 88.0),
          child: BlocBuilder<SearchPageBloc, SearchPageState>(
            builder: (context, state) {
              if (state.status == SearchPageStatus.initial) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state.status == SearchPageStatus.success) {
                return ListView.builder(
                  padding: const EdgeInsets.only(
                    top: 165.0,
                    bottom: 0.0,
                  ),
                  itemCount: state.list.length,
                  itemBuilder: (BuildContext context, int index) {
                    final audio = state.list[index];
                    return PlayerMini(
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
                  },
                );
              }
              if (state.status == SearchPageStatus.failed) {
                return const Center(
                  child: Text('Ой: сталася помилка!'),
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

class _PopupMenuAudioSearchPage extends StatelessWidget {
  const _PopupMenuAudioSearchPage({
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
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return Container();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(
        Icons.more_horiz,
      ),
      iconSize: 40.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
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
          () => AlertDialogApp.instance.alertDialog(
            context,
            idAudio,
            'DeleteCollections',
            'Collections',
          ),
        ),
        popupMenuItem(
          'Поделиться',
          () => AudioRepositories.instance.downloadAudio(
            idAudio,
            name,
          ),
        ),
      ],
    );
  }
}
