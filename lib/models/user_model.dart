class UserModel {
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      displayName: json['displayName'],
      phoneNumb: json['phoneNumb'],
    );
  }

  UserModel({
    this.displayName,
    this.phoneNumb,
  });
  String? displayName;
  String? phoneNumb;

  Map<String, dynamic> toJson() => {
        'displayName': displayName,
        'phoneNumb': phoneNumb,
      };
}
