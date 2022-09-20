import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/language_manager.dart';

class LanguageNotifier extends ChangeNotifier {
  //late BuildContext context;
  void changeLanguage(BuildContext context) {
    if (context.locale == LanguageManager.instance.trLocale) {
      context.setLocale(LanguageManager.instance.enLocale);
    } else {
      context.setLocale(LanguageManager.instance.trLocale);
    }
    notifyListeners();
  }

}
