import 'package:d9l_weather/model.dart';
import 'package:dio/dio.dart';

class DioClient {
//  static final DioClient _instance = DioClient();
//  static DioClient get instance => _instance;

  factory DioClient() => _getInstance();
  static DioClient get instance => _getInstance();
  static DioClient _instance; // 单例对象

  static DioClient _getInstance() {
    if (_instance == null) {
      _instance = DioClient._internal();
    }
    return _instance;
  }

  DioClient._internal();

  static final String rootUrl = 'https://free-api.heweather.net/s6/weather';
  static final String key = 'd77fe2f561f44c1b8a8d365ad503e9bf';
  static final Options options = Options(connectTimeout: 10000);

  // 实况天气  Real-time weather
  Future<void> getRealTimeWeather() async {
    String url = rootUrl + '/now?location=beijing&key=$key';
//    String url = rootUrl + '/now?location=beijing&lang=en&key=$key'; // 支持多语言

    try {
      Response response = await Dio().get(url, options: options);
      RealTimeWeather realTimeWeather;
      realTimeWeather = RealTimeWeather.fromJson(response.data['HeWeather6'].first);

      realTimeWeather.basic = Basic.fromJson(realTimeWeather.mBasic);
      realTimeWeather.update = Update.fromJson(realTimeWeather.mUpdate);
      realTimeWeather.now = Now.fromJson(realTimeWeather.mNow);
    } catch (e) {
      print('getRealTimeWeather error= $e');
    }
  }

  // 3天预报  3 days forecast
  Future<void> getThreeDaysForecast() async {
    String url = rootUrl + '/forecast?location=beijing&key=$key';
    try {
      Response response = await Dio().get(url, options: options);
      ThreeDaysForecast threeDaysForecast;
      threeDaysForecast = ThreeDaysForecast.fromJson(response.data['HeWeather6'].first);

      threeDaysForecast.basic = Basic.fromJson(threeDaysForecast.mBasic);
      threeDaysForecast.update = Update.fromJson(threeDaysForecast.mUpdate);
      for (var d in threeDaysForecast.mDailyForecast) {
        threeDaysForecast.dailyForecasts.add(DailyForecast.fromJson(d));
      }

      print('##########> ${threeDaysForecast.dailyForecasts.first.condTxtD}');
    } catch (e) {
      print('getThreeToSevenForecast error= $e');
    }
  }

  // 生活指数lifestyle
  Future<void> getLifeStyle() async {
    String url = rootUrl + '/lifestyle?location=beijing&key=$key';
    try {
      Response response = await Dio().get(url, options: options);
    } catch (e) {
      print('getLifeStyle error= $e');
    }
  }
}
