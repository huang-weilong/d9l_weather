class ApiController {
  factory ApiController() => _getInstance();

  static ApiController get instance => _getInstance();
  static ApiController _instance; // 单例对象

  static ApiController _getInstance() {
    if (_instance == null) {
      _instance = ApiController._internal();
    }
    return _instance;
  }

  ApiController._internal();

  /////////////////////////////////////////////////////////////////

}
