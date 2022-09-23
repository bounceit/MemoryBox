import 'dart:io';

import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../repositories/audio_firebase_repositories.dart';
import '../../../../../repositories/auth_repository.dart';
import '../../../../../widgets/buttons/popup_menu_item.dart';

class PopupMenuCollectionItemEditAudioPage extends StatelessWidget {
  PopupMenuCollectionItemEditAudioPage({
    Key? key,
    required this.idCollection,
    required this.titleCollection,
    required this.subTitleCollection,
  }) : super(key: key);
  final String idCollection;
  final String titleCollection;
  final String subTitleCollection;
  final List<String> idAudioList = [];
  final List<String> nameList = [];
  final List<List> collectionsList = [];

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
        final List collections = result.data()['collections'];
        idAudioList.add(idAudio);
        collectionsList.add(collections);
        nameList.add(name);
      }
    });
  }

  Future<void> _deselect(BuildContext context) async {
    await _getIdAudio(context);
    for (List<Object> item in IterableZip(
      [
        idAudioList,
        collectionsList,
      ],
    )) {
      final idAudio = item[0];
      final collectionsTemp = item[1];
      final collections = collectionsTemp as List;
      await AudioRepositories.instance.addAudioCollections(
        idCollection,
        '$idAudio',
        collections,
        true,
      );
    }
  }

  Future<void> _share(BuildContext context) async {
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
  }

  Future<void> _downloadAll(BuildContext context) async {
    await _getIdAudio(context);
    for (List<String> item in IterableZip(
      [
        idAudioList,
        nameList,
      ],
    )) {
      final idAudio = item[0];
      final name = item[1];

      Directory? directory;
      PermissionStatus status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
      }
      try {
        if (Platform.isIOS) {
          directory = await path_provider.getApplicationDocumentsDirectory();
        } else {
          directory = Directory(
            '/storage/emulated/0/Download',
          );
          if (!await directory.exists()) {
            directory = await path_provider.getExternalStorageDirectory();
          }
        }
      } catch (err) {
        if (kDebugMode) {
          print(
            'Cannot get download folder path',
          );
        }
      }
      final filePath = '${directory!.path}/$name.mp3';

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
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '$name.mp3',
            style: const TextStyle(
              color: AppColors.colorText,
            ),
          ),
          backgroundColor: Colors.white,
        ),
      );
    }
  }

  Future<void> _deleteAll(BuildContext context) async {
    await _getIdAudio(context);
    for (List<Object> item in IterableZip(
      [
        idAudioList,
        collectionsList,
      ],
    )) {
      final idAudio = item[0];
      final collectionsTemp = item[1];
      final collections = collectionsTemp as List;
      await AudioRepositories.instance.addAudioCollections(
        idCollection,
        '$idAudio',
        collections,
        false,
      );
    }
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
          'Отменить выбор',
          () => _deselect(context),
        ),
        popupMenuItem(
          'Поделиться',
          () => _share(context),
        ),
        popupMenuItem(
          'Скачать все',
          () => _downloadAll(context),
        ),
        popupMenuItem(
          'Удалить все',
          () => _deleteAll(context),
        ),
      ],
    );
  }
}
