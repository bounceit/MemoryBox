import 'package:flutter/material.dart';

class ModelRP with ChangeNotifier {
  String? _path;
  String? _duration;

  get getDuration => _duration;

  void setDuration(String minutes, String seconds) {
    _duration = '$minutes:$seconds';
    notifyListeners();
  }

  String get getData => _path!;

  void changeString(String newString) {
    _path = newString;
    notifyListeners();
  }
}
