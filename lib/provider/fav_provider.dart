import 'package:flutter/foundation.dart';

class FavoriteProvider extends ChangeNotifier {
  List<int> _selectItem = [];
  List<int> get selectItem => _selectItem;
  addItem(int value) {
    _selectItem.add(value);
    notifyListeners();
  }

  removeItem(int value) {
    _selectItem.remove(value);
    notifyListeners();
  }
}
