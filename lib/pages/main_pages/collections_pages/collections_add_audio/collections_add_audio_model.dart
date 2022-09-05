import 'package:flutter/material.dart';

class CollectionsAddAudioModel extends ChangeNotifier {
  String? _searchtxt;
  String? _searchAddAudio;
  bool? _done;

  bool? get getDone => _done;
  void setDone(bool done) {
    _done = done;
    notifyListeners();
  }

  String get getSearchtxt => _searchtxt!;

  void setSearchtxt(String searchtxt) {
    _searchtxt = _searchtxt;
    notifyListeners();
  }

  String? get getSearchAddAudio => _searchAddAudio;

  void setSearchAddAudio(String searchAddAudio) {
    _searchAddAudio = searchAddAudio;
    notifyListeners();
  }
}
