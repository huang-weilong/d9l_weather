import 'package:shared_preferences/shared_preferences.dart';

class SpClient {
  static final SpClient _instance = SpClient._internal();
  factory SpClient() => _instance;
  SpClient._internal();

  static late SharedPreferences _sp;

  static Future<SpClient> getInstance() async {
    _sp = await SharedPreferences.getInstance();
    return _instance;
  }

  static String? getString(String key) {
    return _sp.getString(key);
  }

  static Future<bool?>? setString(String key, String value) async {
    return _sp.setString(key, value);
  }

  static int? getInt(String key) {
    return _sp.getInt(key);
  }

  static Future<bool?>? setInt(String key, int value) async {
    return _sp.setInt(key, value);
  }
}
