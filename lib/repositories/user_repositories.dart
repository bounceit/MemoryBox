import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:uuid/uuid.dart';

import '../models/user_model.dart';

class UserRepositories {
  UserRepositories() {
    init();
  }
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  FirebaseAuth? auth;
  User? user;
  var uuid = const Uuid();

  void init() {
    auth = FirebaseAuth.instance;
    user = auth!.currentUser;
  }

  //Stream list user

  Stream<List<UserModel>> readUser() => FirebaseFirestore.instance
      .collection(user!.phoneNumber!)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => UserModel.fromJson(doc.data())).toList());

  // Basic filling of the database at the first event

  Future<void> firstAuthorization() async {
    final DateTime now = DateTime.now();
    final DateTime later = now.add(const Duration(days: 30));
    final Timestamp laterTimestamp = Timestamp.fromDate(later);
    await FirebaseFirestore.instance
        .collection(user!.phoneNumber!)
        .doc('user')
        .set({
      'displayName': 'Имя',
      'phoneNumb': '+00(000)0000000',
      'avatarUrl': '',
      'onceAMonth': false,
      'onceAYear': false,
      'onlyMonth': false,
      'subscription': true,
      'totalSize': 0,
      'totalTime': '00:00',
    });
  }
}
