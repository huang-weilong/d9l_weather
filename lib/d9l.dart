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

  static final Map toastStr = {
    'zh': {"permission": "没有权限", "unknown": "未知地址", "no_more_requests": "超出查询次数", "update": "更新成功"},
    'en': {
      "permission": "permission denied",
      "unknown": "unknown location",
      "no_more_requests": "no more requests",
      "update": "update success"
    },
  };
}
