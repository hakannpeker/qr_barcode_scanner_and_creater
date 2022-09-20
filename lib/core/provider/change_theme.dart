import 'package:flutter/material.dart';

import '../init/cache/locale_manager.dart';

class ThemeNotifier extends ChangeNotifier {
  bool isLightTheme = false;
  ThemeData? currentTheme;

  ThemeNotifier(bool darkThemeOn) {
    currentTheme = darkThemeOn ? ThemeData.dark() : ThemeData.light();
  }

  Future<void> changeTheme() async {
    isLightTheme = !isLightTheme;

    if (currentTheme == ThemeData.dark()) {
      currentTheme = ThemeData.light();
      LocaleManager.instance.setBoolValue("isLightTheme", false);
    } else {
      currentTheme = ThemeData.dark();
      LocaleManager.instance.setBoolValue("isLightTheme", true);
    }
    notifyListeners();
  }

  ThemeData? get getTheme => currentTheme;
}
