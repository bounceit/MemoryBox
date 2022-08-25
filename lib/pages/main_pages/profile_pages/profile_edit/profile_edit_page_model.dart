import 'package:audio_fairy_tales/pages/main_pages/profile_pages/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../repositories/user_repositories.dart';
import '../../../../widgets/uncategorized/image_picker.dart';

class ProfileEditPageModel extends ChangeNotifier {
  String? _name;
  String? _number;
  String? _singleImage;

  String? get getName => _name;
  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  String? get getNumber => _number;
  void setNumber(String number) {
    _number = number;
    notifyListeners();
  }

  String? get getSingleImage => _singleImage;
  Future<void> onTapPhoto(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    XFile? image = await ImagePick().singleImagePick();
    if (image != null && image.path.isNotEmpty) {
      _singleImage = await UserRepositories().uploadImage(image);
      context.read<DataModel>().userImage(_singleImage!);
      await prefs.setString(
          'image', await UserRepositories().uploadImage(image));
      notifyListeners();
    }
  }
}
