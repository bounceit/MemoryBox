import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as pathprovider;
import 'package:permission_handler/permission_handler.dart';

import '../recursec/app_colors.dart';

class LocalSaveAudioFIle {
  Future<void> saveAudioStorageDirectory(
      BuildContext context, String newPath, String name) async {
    Directory? directory;
    PermissionStatus status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    try {
      if (Platform.isIOS) {
        directory = await pathprovider.getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/Download');
        if (!await directory.exists()) {
          directory = await pathprovider.getExternalStorageDirectory();
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print('Cannot get download folder path');
      }
    }
    final fliePath = '${directory!.path}/$name.mp3';
    File file = File(fliePath);
    File fileTemp = File(newPath);
    bool isExist = await file.exists();
    if (!isExist) {
      await file.create();
    }
    Uint8List rat = await fileTemp.readAsBytes();
    await file.writeAsBytes(rat);
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        '$name.mp3',
        style: const TextStyle(color: AppColors.audioAppBar),
      ),
      backgroundColor: Colors.white,
    ));
  }
}
