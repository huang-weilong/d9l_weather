import 'package:shared_preferences/shared_preferences.dart';

class SpClient {
  static SharedPreferences sp;
  static SpClient _instance;

  static Future<SpClient> getInstance() async {
    if (_instance == null) {
      _instance = SpClient._internal();
      await _instance._init();
    }
    return _instance;
  }

  SpClient._internal();

  Future _init() async {
    sp = await SharedPreferences.getInstance();
  }
}
