import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> set({required String key, required dynamic value}) async {
    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    } else if (value is List<String>) {
      await _prefs.setStringList(key, value);
    } else {
      throw UnsupportedError('Unsupported value type');
    }
  }

  static String? getString({required String key}) => _prefs.getString(key);
  static int? getInt({required String key}) => _prefs.getInt(key);
  static bool? getBool({required String key}) => _prefs.getBool(key);
  static double? getDouble({required String key}) => _prefs.getDouble(key);
  static List<String>? getStringList({required String key}) {
    return _prefs.getStringList(key);
  }

  static Future<bool> remove({required String key}) async =>
      await _prefs.remove(key);
  static Future<bool> clearAllData() async => await _prefs.clear();
}
