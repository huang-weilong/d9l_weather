class D9l {
  factory D9l() => _getInstance();

  static D9l get instance => _getInstance();
  static D9l _instance; // 单例对象

  static D9l _getInstance() {
    if (_instance == null) {
      _instance = D9l._internal();
    }
    return _instance;
  }

  D9l._internal();

  //////////////////////////////////////////////////////

  String lang = 'zh';
}
