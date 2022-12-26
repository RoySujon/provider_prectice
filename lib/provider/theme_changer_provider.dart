import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  var _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;
  setTheme(themMode) {
    _themeMode = themMode;
    notifyListeners();
    // dkdndm
  }
}
