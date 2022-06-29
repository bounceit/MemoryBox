import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? displayName;
  String? phoneNumb;

  UserModel({
    this.displayName,
    this.phoneNumb,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      displayName: json['displayName'],
      phoneNumb: json['phoneNumb'],
    );
  }

  Map<String, dynamic> toJson() => {
        'displayName': displayName,
        'phoneNumb': phoneNumb,
      };
}
