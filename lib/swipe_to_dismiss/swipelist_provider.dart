import 'package:flutter/foundation.dart';
import 'dart:collection';

class SourceList with ChangeNotifier {
  final _myList = List<String>.generate(10, (i) {
    return "Number $i";
  });

  List<String> get values => UnmodifiableListView(_myList);

  void removeItem(int index) {
    _myList.removeAt(index);
    notifyListeners();
  }
}
