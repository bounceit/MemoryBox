import 'package:flutter/material.dart';

class SearchPageModel extends ChangeNotifier {
  String? _searchData;

  String? get getSearchData => _searchData;
  void setSearchData(String searchData) {
    _searchData = searchData;
    notifyListeners();
  }
}
