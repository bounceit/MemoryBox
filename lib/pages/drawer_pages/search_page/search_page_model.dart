import 'package:flutter/material.dart';

class SearchPageModel extends ChangeNotifier {
  String? _searchData;

  get getSearchData => _searchData;
  void setSearchData(String searchData) {
    _searchData = searchData;
    notifyListeners();
  }
}
