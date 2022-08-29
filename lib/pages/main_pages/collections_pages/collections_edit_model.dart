import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../repositories/user_repositories.dart';
import '../../../widgets/uncategorized/image_picker.dart';

class CollectionsEditModel with ChangeNotifier {
  final ImagePick _imagePick = ImagePick();
  String? _title = 'Без названия';
  String? _subTitle = '...';
  String? _image = '';
  String? _id;
  String? _singleImage;

  String? get getSingleImage => _singleImage;

  Future<void> imagePickPhoto(BuildContext context) async {
    XFile? image = await _imagePick.singleImagePick();
    if (image != null && image.path.isNotEmpty) {
      _singleImage = await UserRepositories().uploadImage(image);
      context.read<CollectionsEditModel>().image(_singleImage ?? '');
      notifyListeners();
    }
  }

  void setId(String idCollection) {
    _id = idCollection;
    notifyListeners();
  }

  String? get getId => _id;

  void userTitle(String title) {
    _title = title;
    notifyListeners();
  }

  String? get getTitle => _title;

  void userSubTitle(String subTitle) {
    _subTitle = subTitle;
    notifyListeners();
  }

  String? get getSubTitle => _subTitle;

  void image(String image) {
    _image = image;
    notifyListeners();
  }

  String? get getImage => _image;
}
