import 'package:d9l_weather/api/api.dart';
import 'package:d9l_weather/models/model.dart';

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

  Future<RealTimeWeather> getRealTimeWeather(String cid) async {
    var result = await Api().getRealTimeWeather(cid);

    RealTimeWeather realTimeWeather;

    if (result != null) {
      realTimeWeather = RealTimeWeather.fromJson(result['HeWeather6'].first);
      if (realTimeWeather.status == 'ok') {
        realTimeWeather.basic = Basic.fromJson(realTimeWeather.mBasic);
        realTimeWeather.update = Update.fromJson(realTimeWeather.mUpdate);
        realTimeWeather.now = Now.fromJson(realTimeWeather.mNow);
      }
    }

    return realTimeWeather;
  }
}
