class D9l {
  static final D9l _singleton = D9l._internal();
  factory D9l() => _singleton;
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
