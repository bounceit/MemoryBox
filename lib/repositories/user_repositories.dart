import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  Future<void> firstAuthorization() async {
    await FirebaseFirestore.instance.collection(user!.phoneNumber!).doc().set({
      'displayName': 'Имя',
      'phoneNumb': '+00(000)0000000',
    });
  }
}
