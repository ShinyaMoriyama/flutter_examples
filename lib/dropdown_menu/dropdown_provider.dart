import 'package:flutter/material.dart';
import 'dart:collection';

class DropdownText with ChangeNotifier {
  static final _list = ["", "Pasta", "Pizza", "Maccheroni"]
      .map<DropdownMenuItem<String>>((item) {
    return DropdownMenuItem<String>(
      value: item,
      child: Text(item),
    );
  }).toList();

  final menuItems = UnmodifiableListView(_list);

  // If _text does not included in the _list, An exception happens
  var _text = "";
  String get text => _text;

  void setText(String value) {
    _text = value;
    notifyListeners();
  }
}
