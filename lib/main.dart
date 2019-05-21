import 'package:d9l_weather/dio_client.dart';
import 'package:d9l_weather/home_page.dart';
import 'package:d9l_weather/model.dart';
import 'package:d9l_weather/sp_client.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  RealTimeWeather realTimeWeather;
  List<DailyForecast> dailyForecastList;

  Future<void> _updateWeather(String cid) async {
    await DioClient().getRealTimeWeather(cid).then((v) {
      if (v != null) {
        realTimeWeather = v;
      }
    });

    await DioClient().getThreeDaysForecast(cid).then((v) {
      if (v != null) {
        dailyForecastList = v.dailyForecasts;
      }
    });
  }

  Future.wait([initializeDateFormatting("zh_CN", null), SpClient.getInstance()]).then((_) async {
    DioClient();
    if (SpClient.sp.getString('cid') != null) {
      String cid = SpClient.sp.getString('cid');
      await _updateWeather(cid);
    }
    runApp(MyApp(realTimeWeather: realTimeWeather, dailyForecastList: dailyForecastList));
  });
}

class MyApp extends StatelessWidget {
  MyApp({this.realTimeWeather, this.dailyForecastList});

  final RealTimeWeather realTimeWeather;
  final List<DailyForecast> dailyForecastList;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'd9l weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(realTimeWeather: realTimeWeather, dailyForecastList: dailyForecastList),
    );
  }
}
