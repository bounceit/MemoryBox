import 'dart:io';

import 'package:audio_fairy_tales/models/user_model.dart';
import 'package:audio_fairy_tales/repositories/user_repositories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uuid/uuid.dart';

import '../models/audio_model.dart';

class AudioRepositories {
  AudioRepositories() {
    init();
  }
  UserModel userModel = UserModel();
  UserRepositories repositories = UserRepositories();
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  FirebaseAuth? auth;
  User? user;
  var uuid = const Uuid();

  void init() {
    auth = FirebaseAuth.instance;
    user = auth!.currentUser;
  }

  //Stream play list delete audio

  Stream<List<AudioModel>> readAudioDelete(String sort) => FirebaseFirestore
      .instance
      .collection(user!.phoneNumber!)
      .doc('id')
      .collection('DeleteCollections')
      .where('collections', arrayContains: sort)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => AudioModel.fromJson(doc.data())).toList());

  //Stream play list audio

  Stream<List<AudioModel>> readAudioSort(String sort) => FirebaseFirestore
      .instance
      .collection(user!.phoneNumber!)
      .doc('id')
      .collection('Collections')
      .where('collections', arrayContains: sort)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => AudioModel.fromJson(doc.data())).toList());

// Save audio file in firebase

  Future<void> addAudio(
    String path,
    String name,
    String duration,
    Set searchName,
  ) async {
    String id = uuid.v1();
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref('${user!.phoneNumber!}/userAudio/$id.mp3');
    await ref.putFile(File(path),
        firebase_storage.SettableMetadata(contentType: 'audio/mp3'));
    final file = File(path);
    final statFile = await file.stat();
    final size = statFile.size;
    final todayDate = DateTime.now();
    final todayDate2 = Timestamp.now();
    final model = AudioModel(
      collections: ['all'],
      id: id,
      audioName: name,
      audioUrl: await ref.getDownloadURL(),
      duration: duration,
      dateTime: formatDate(
          todayDate, [dd, '.', mm, '.', yy, HH, ':', nn, ':', ss, z]),
      dateTimeDelete: todayDate2,
      done: false,
      playPause: false,
      searchName: searchName.toList(),
      size: size,
    );
    final json = model.toJson();

    await FirebaseFirestore.instance
        .collection(user!.phoneNumber!)
        .doc('id')
        .collection('Collections')
        .doc(id)
        .set(json);
  }

  //Add audio in collection

  Future<void> addAudioCollections(String nameCollection, String idAudio,
      List collections, bool done) async {
    if (done == true) {
      collections.add(nameCollection);
    }
    if (done == false) {
      collections.remove(nameCollection);
    }

    FirebaseFirestore.instance
        .collection(user!.phoneNumber!)
        .doc('id')
        .collection('Collections')
        .doc(idAudio)
        .update({'collections': collections});
  }

  // Rename audio file in firebase

  Future<void> renameAudio(
    String idAudio,
    String newNameAudio,
    String newAudioUrl,
    String newDuration,
    String newDateTime,
    List newSearchName,
    List collections,
    bool newDone,
  ) async {
    final model = AudioModel(
        id: idAudio,
        audioName: newNameAudio,
        audioUrl: newAudioUrl,
        duration: newDuration,
        done: newDone,
        searchName: newSearchName,
        dateTime: newDateTime,
        collections: collections);

    final json = model.toJson();

    FirebaseFirestore.instance
        .collection(user!.phoneNumber!)
        .doc('id')
        .collection('Collections')
        .doc(idAudio)
        .update(json);
  }

  // Done in Audio

  Future<void> doneAudioItem(
      String idAudio, bool done, String collectionFire) async {
    FirebaseFirestore.instance
        .collection(user!.phoneNumber!)
        .doc('id')
        .collection(collectionFire)
        .doc(idAudio)
        .update({'done': done});
  }

  // Share audio file

  Future<void> downloadAudio(String idAudio, String name) async {
    Directory directory = await getTemporaryDirectory();
    final filePath = '${directory.path}/$name.mp3';
    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('${user!.phoneNumber!}/userAudio/$idAudio.mp3')
          .writeToFile(File(filePath));
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Ошибка $e');
      }
    }
    await Share.shareFiles(
      [filePath],
    );
  }

  // Play/Pause in playing PlayerCollections

  Future<void> playPause(String idAudio, bool donePlay) async {
    FirebaseFirestore.instance
        .collection(user!.phoneNumber!)
        .doc('id')
        .collection('Collections')
        .doc(idAudio)
        .update({'playPause': donePlay});
  }
}
