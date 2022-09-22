// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:typed_data';

import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:audio_fairy_tales/widgets/buttons/alert_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:permission_handler/permission_handler.dart';

class LocalSaveAudioFile {
  LocalSaveAudioFile._();
  static final LocalSaveAudioFile instance = LocalSaveAudioFile._();

  // Save audio file in phone memory

  Future<void> saveAudioStorageDirectory(
    BuildContext context,
    String newPath,
    String name,
  ) async {
    Directory? directory;
    bool status = await Permission.storage.shouldShowRequestRationale;
    if (status == false) {
      PermissionStatus status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
      }
    } else {
      AlertDialogApp.instance.alertDialogPermission(
        context,
        'Разрешыть приложению доступ к фото, мультимедиа и файлам на устройстве?',
        Icons.folder_open,
      );
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
        print('Cannot get download folder path');
      }
    }
    final filePath = '${directory!.path}/$name.mp3';
    File file = File(filePath);
    File fileTemp = File(newPath);
    bool isExist = await file.exists();
    if (!isExist) {
      await file.create();
    }
    Uint8List rat = await fileTemp.readAsBytes();
    await file.writeAsBytes(rat);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        '$name.mp3',
        style: const TextStyle(
          color: AppColors.colorText,
        ),
      ),
      backgroundColor: Colors.white,
    ));
  }
}
