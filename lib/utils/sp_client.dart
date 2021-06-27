import 'package:shared_preferences/shared_preferences.dart';

class SpClient {
  static final SpClient _spClient = SpClient._internal();
  factory SpClient() => _spClient;
  SpClient._internal() {
    _init();
  }

  late SharedPreferences _sp;

  Future _init() async {
    _sp = await SharedPreferences.getInstance();
  }

  String? getString(String key) {
    return _sp.getString(key);
  }

  Future<bool?>? setString(String key, String value) async {
    return _sp.setString(key, value);
  }
}
