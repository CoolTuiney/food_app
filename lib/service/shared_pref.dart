import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();

  static const String cartKey = 'cart';
  static const String userLogin = 'login';
  static const String orderId = 'orderId';

  static set(String key, String value) async {
    final SharedPreferences pref = await _prefs;

    await pref.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    final SharedPreferences pref = await _prefs;
    String? res = pref.getString(key);
    return res;
  }

  static Future<bool> removeString(String key) async {
    final SharedPreferences pref = await _prefs;
    return await pref.remove(key);
  }
}
