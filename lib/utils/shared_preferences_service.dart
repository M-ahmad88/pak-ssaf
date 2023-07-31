import 'package:shared_preferences/shared_preferences.dart';

import '../string_en.dart';

class SharedPreferencesService {
  SharedPreferences? _preferences;

  Future<SharedPreferences> get preferences async {
    return _preferences ??= await SharedPreferences.getInstance();
  }

  Future<bool> getBool(String key) async {
    final prefs = await preferences;
    return prefs.getBool(key) ?? false;
  }

  Future<void> setBool(String key, bool value) async {
    final prefs = await preferences;
    await prefs.setBool(key, value);
  }

  Future<String> getString(String key) async {
    final prefs = await preferences;
    return prefs.getString(key) ?? Strings.empty_string;
  }

    Future<int> getInt(String key) async {
    final prefs = await preferences;
    return prefs.getInt(key) ?? 0;
  }



  Future<void> setString(String key, String value) async {
    final prefs = await preferences;
    await prefs.setString(key, value);
  }
  Future<void> setInt(String key, int value) async {
    final prefs = await preferences;
    await prefs.setInt(key, value);
  }

}
