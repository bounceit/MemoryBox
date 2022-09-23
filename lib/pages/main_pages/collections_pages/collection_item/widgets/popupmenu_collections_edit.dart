import 'dart:async';
import 'dart:io';

import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collections/collections.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../repositories/auth_repository.dart';
import '../../../../../repositories/collections_repositories.dart';
import '../../../../../widgets/buttons/popup_menu_item.dart';
import '../../collection_item_edit/collection_item_edit.dart';
import '../../collection_item_edit_audio/collection_item_edit_audio.dart';

// ignore: must_be_immutable
class PopupMenuCollectionItemPage extends StatelessWidget {
  PopupMenuCollectionItemPage({
    Key? key,
    required this.idCollection,
    required this.titleCollection,
    required this.subTitleCollection,
    required this.qualityCollection,
    required this.imageCollection,
    required this.dataCollection,
    required this.totalTimeCollection,
  }) : super(key: key);
  final String idCollection;
  final String titleCollection;
  final String subTitleCollection;
  final String qualityCollection;
  final String imageCollection;
  final String dataCollection;
  final String totalTimeCollection;
  List<String> idAudioList = [];
  List<String> nameList = [];

  Future<void> _getIdAudio(BuildContext context) async {
    await FirebaseFirestore.instance
        .collection(AuthRepositories.instance.user!.phoneNumber!)
        .doc('id')
        .collection('Collections')
        .where('collections', arrayContains: idCollection)
        .get()
        .then((querySnapshot) {
      for (QueryDocumentSnapshot<Map<String, dynamic>> result
          in querySnapshot.docs) {
        final String idAudio = result.data()['id'];
        final String name = result.data()['audioName'];
        idAudioList.add(idAudio);
        nameList.add(name);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(
        Icons.more_horiz,
        color: AppColors.white,
      ),
      iconSize: 40.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      itemBuilder: (_) => [
        popupMenuItem(
          'Редактировать',
          () {
            Timer(const Duration(seconds: 1), () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return CollectionItemEditPage(
                    qualityCollection: qualityCollection,
                    dataCollection: dataCollection,
                    titleCollection: titleCollection,
                    imageCollection: imageCollection,
                    idCollection: idCollection,
                    totalTimeCollection: totalTimeCollection,
                    subTitleCollection: subTitleCollection,
                  );
                }),
              );
            });
          },
        ),
        popupMenuItem(
          'Выбрать несколько',
          () {
            Timer(const Duration(seconds: 1), () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return CollectionItemEditAudio(
                    qualityCollection: qualityCollection,
                    dataCollection: dataCollection,
                    titleCollection: titleCollection,
                    imageCollection: imageCollection,
                    idCollection: idCollection,
                    totalTimeCollection: totalTimeCollection,
                    subTitleCollection: subTitleCollection,
                  );
                }),
              );
            });
          },
        ),
        popupMenuItem(
          'Удалить подборку',
          () {
            Timer(const Duration(seconds: 1), () {
              CollectionsRepositories.instance.deleteCollection(
                idCollection,
                'CollectionsTale',
              );
              Navigator.pushNamed(
                context,
                Collections.routeName,
              );
            });
          },
        ),
        popupMenuItem(
          'Поделиться',
          () async {
            await _getIdAudio(context);
            List<String> listFilePath = [];
            for (List<String> item in IterableZip(
              [
                idAudioList,
                nameList,
              ],
            )) {
              final idAudio = item[0];
              final name = item[1];
              Directory directory = await getTemporaryDirectory();
              final filePath = '${directory.path}/$name.mp3';
              listFilePath.add(filePath);
              try {
                await FirebaseStorage.instance
                    .ref(
                      '${AuthRepositories.instance.user!.phoneNumber!}/userAudio/$idAudio.m4a',
                    )
                    .writeToFile(
                      File(filePath),
                    );
              } on FirebaseException catch (e) {
                if (kDebugMode) {
                  print('Ошибка $e');
                }
              }
            }
            await Share.shareFiles(
              listFilePath,
              text: titleCollection,
              subject: subTitleCollection,
            );
          },
        ),
      ],
    );
  }
}
