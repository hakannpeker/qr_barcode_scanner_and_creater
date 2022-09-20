import 'package:shared_preferences/shared_preferences.dart';

import '../../../product/constants/enum/shared_keys.dart';

class LocaleManager {
  static LocaleManager? _instance;
  SharedPreferences? _preferences;
  static LocaleManager get instance {
    _instance ??= LocaleManager._init();
    return _instance!;
  }

  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static Future preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> setStringValue(SharedKeys keys, String value) async {
    await _preferences?.setString(keys.toString(), value);
  }

  String getStringValue(SharedKeys keys) {
    return _preferences?.getString(keys.toString()) ?? "";
  }

  Future<void> setBoolValue(String keys, bool value) async {
    await _preferences?.setBool(keys, value);
  }

  bool getBoolValue(String keys) {
    return _preferences?.getBool(keys) ?? false;
  }
}
