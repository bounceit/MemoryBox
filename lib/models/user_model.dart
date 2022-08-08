class UserModel {
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      displayName: json['displayName'],
      phoneNumb: json['phoneNumb'],
      totalTime: json['totalTime'],
      totalQuality: json['totalQuality'],
    );
  }

  UserModel({
    this.displayName,
    this.phoneNumb,
    this.totalTime,
    this.totalQuality,
  });
  String? displayName;
  String? phoneNumb;
  String? totalTime;
  int? totalQuality;

  Map<String, dynamic> toJson() => {
        'displayName': displayName,
        'phoneNumb': phoneNumb,
        'totalTime': totalTime,
        'totalQuality': totalQuality,
      };
}
