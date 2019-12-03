import 'package:d9l_weather/d9l.dart';
import 'package:d9l_weather/models/model.dart';
import 'package:dio/dio.dart';

class Api {
  factory Api() => _getInstance();
  static Api get instance => _getInstance();
  static Api _instance; // 单例对象

  static Api _getInstance() {
    if (_instance == null) {
      _instance = Api._internal();
    }
    return _instance;
  }

  Api._internal();

  static final String rootUrl = 'https://free-api.heweather.net/s6/weather';
  static final String key = 'd77fe2f561f44c1b8a8d365ad503e9bf';
  static final Options options = Options();
  static final BaseOptions baseOptions = BaseOptions(connectTimeout: 10000);

  // 实况天气  Real-time weather
  Future getRealTimeWeather(String cid) async {
    String url = rootUrl + '/now';
//    String url = rootUrl + '/now?location=beijing&lang=en&key=$key'; // 支持多语言

    try {
      Response response = await Dio(baseOptions).get(url, options: options, queryParameters: {
        'location': cid,
        'lang': D9l().lang,
        'key': key,
      });
      return response.data;
    } catch (e) {
      print('getRealTimeWeather error= $e');
      return null;
    }
  }

  // 3天预报  3 days forecast
  Future<ThreeDaysForecast> getThreeDaysForecast(String cid) async {
    String url = rootUrl + '/forecast';
    try {
      Response response = await Dio(baseOptions).get(url, options: options, queryParameters: {
        'location': cid,
        'lang': D9l().lang,
        'key': key,
      });
      ThreeDaysForecast threeDaysForecast;
      threeDaysForecast = ThreeDaysForecast.fromJson(response.data['HeWeather6'].first);

      threeDaysForecast.basic = Basic.fromJson(threeDaysForecast.mBasic);
      threeDaysForecast.update = Update.fromJson(threeDaysForecast.mUpdate);
      for (var d in threeDaysForecast.mDailyForecasts) {
        threeDaysForecast.dailyForecasts.add(DailyForecast.fromJson(d));
      }
      return threeDaysForecast;
    } catch (e) {
      print('getThreeToSevenForecast error= $e');
      return null;
    }
  }

  // 生活指数lifestyle
  Future<void> getLifeStyle() async {
    String url = rootUrl + '/lifestyle?location=beijing&key=$key';
    try {
      Response response = await Dio(baseOptions).get(url, options: options);
      TodayLifeStyle todayLifeStyle = TodayLifeStyle.fromJson(response.data['HeWeather6'].first);
      todayLifeStyle.basic = Basic.fromJson(todayLifeStyle.mBasic);
      todayLifeStyle.update = Update.fromJson(todayLifeStyle.mUpdate);
      for (var l in todayLifeStyle.mLifeStyles) {
        todayLifeStyle.lifeStyles.add(LifeStyle.fromJson(l));
      }
      print('===========> ${todayLifeStyle.lifeStyles.first.txt}');
    } catch (e) {
      print('getLifeStyle error= $e');
    }
  }

  // 城市搜索 city
  Future<List<Basic>> searchCity(String keyword) async {
    String url = 'https://search.heweather.net/find';
    try {
      Response response = await Dio(baseOptions).get(url, options: options, queryParameters: {
        'location': keyword,
        'lang': D9l().lang,
        'key': key,
        'mode': '',
        'number': 20,
      });

      List<Basic> cityList = [];
      if (response.data['HeWeather6'] != null) {
        for (var c in response.data['HeWeather6'].first['basic']) {
          cityList.add(Basic.fromJson(c));
        }
      }
      print('==============> ${response.data}');
      return cityList;
    } catch (e) {
      print('searchCity error= $e');
      return null;
    }
  }
}
