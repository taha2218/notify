import 'package:flutter/foundation.dart';

class Index with ChangeNotifier {

  int _indexOfScreen = 0;

  int get indexOfScreen => _indexOfScreen;

  set indexOfScreen(int indexValue) {
    _indexOfScreen = indexValue;
    notifyListeners();
  }

}