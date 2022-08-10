import 'package:flutter/material.dart';

class AudioRecordingsPagePlayerModel extends ChangeNotifier {
  double? _anim = 0.0;

  void setAnim(double anim) {
    _anim = anim;
    notifyListeners();
  }

  get getAnim => _anim;
}
