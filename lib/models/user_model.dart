import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      displayName: json['displayName'],
      phoneNumb: json['phoneNumb'],
      avatarUrl: json['avatarUrl'],
      totalTime: json['totalTime'],
      totalQuality: json['totalQuality'],
      totalSize: json['totalSize'],
      subscription: json['subscription'],
      finishTimeSubscription: json['finishTimeSubscription'],
      subscriptionLimit: json['subscriptionLimit'],
      onceAMonth: json['onceAMonth'],
      onceAYear: json['onceAYear'],
      onlyMonth: json['onlyMonth'],
    );
  }

  UserModel({
    this.displayName,
    this.phoneNumb,
    this.avatarUrl,
    this.totalTime,
    this.totalQuality,
    this.totalSize,
    this.subscription,
    this.finishTimeSubscription,
    this.subscriptionLimit,
    this.onceAMonth,
    this.onceAYear,
    this.onlyMonth,
  });
  String? displayName;
  String? phoneNumb;
  String? avatarUrl;
  String? totalTime;
  int? totalQuality;
  int? totalSize;
  bool? subscription;
  Timestamp? finishTimeSubscription;
  int? subscriptionLimit;
  bool? onceAMonth;
  bool? onceAYear;
  bool? onlyMonth;

  Map<String, dynamic> toJson() => {
        'displayName': displayName,
        'phoneNumb': phoneNumb,
        'avatarUrl': avatarUrl,
        'totalTime': totalTime,
        'totalQuality': totalQuality,
        'totalSize': totalSize,
        'subscription': subscription,
        'finishTimeSubscription': finishTimeSubscription,
        'subscriptionLimit': subscriptionLimit,
        'onceAMonth': onceAMonth,
        'onceAYear': onceAYear,
        'onlyMonth': onlyMonth
      };
}
