import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../core/init/cache/locale_manager.dart';
import '../../core/provider/change_language.dart';
import '../../core/provider/change_theme.dart';
import 'localization_init.dart';

class ProductInit {
  final LocalizationInit localizationInit = LocalizationInit();
  final List<SingleChildWidget> providers = [
    ChangeNotifierProvider<ThemeNotifier>(
      create: (context) => ThemeNotifier(LocaleManager.instance.getBoolValue("isLightTheme")),
    ),
    ChangeNotifierProvider<LanguageNotifier>(
      create: (context) => LanguageNotifier(),
    ),
    
  ];

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await LocaleManager.preferencesInit();

    await EasyLocalization.ensureInitialized();
  }
}
