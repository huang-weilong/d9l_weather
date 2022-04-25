import 'package:d9l_weather/models/model.dart';
import 'package:d9l_weather/utils/d9l.dart';
import 'package:d9l_weather/utils/http.dart';
import 'package:d9l_weather/utils/sp_client.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<Basic> basic = Basic().obs;
  Rx<Update> updateM = Update().obs;
  Rx<Now> now = Now().obs;
  Rx<List<DailyForecast>> dailyForecastList = RxList<DailyForecast>().obs;
  Rx<List<LifeStyle>> lifeStyleList = RxList<LifeStyle>().obs;
  Rx<AirQuality> airQuality = AirQuality().obs;

  String? status;
  String? cid = 'CN101280101';
  Map lsType = {
    'comf': '舒适度',
    'cw': '洗车',
    'drsg': '穿衣',
    'flu': '感冒',
    'sport': '运动',
    'trav': '旅游',
    'uv': '紫外线',
    'air': '空气',
  };

  Future<bool> getWeather() async {
//    status = null;

    await Future.wait([_getNow(), _getForecast(), _getAirQuality(), _getLifeStyle()]);

    if (status != null) {
      if (status!.contains('permission')) {
        this.cid = SpClient.getString('cid')!;
        Fluttertoast.showToast(msg: D9l.toastStr[D9l().lang]['permission']);
        return false;
      } else if (status!.contains('unknown')) {
        this.cid = SpClient.getString('cid')!;
        Fluttertoast.showToast(msg: D9l.toastStr[D9l().lang]['unknown']);
        return false;
      } else if (status!.contains('no more')) {
        this.cid = SpClient.getString('cid')!;
        Fluttertoast.showToast(msg: D9l.toastStr[D9l().lang]['no_more_requests']);
        _setEmptyData();
        return false;
      }
      SpClient.setString('cid', cid!);
      return true;
    } else {
      _setEmptyData();
      return false;
    }
  }

  void _setEmptyData() {
    basic = Rx(Basic(location: '??'));
    now = Rx(Now(tmp: '??', pres: '??', windDir: '??', hum: '??', fl: '??', condTxt: '??'));
    dailyForecastList.value.clear();

    dailyForecastList.update((val) {
      for (int i = 0; i < 3; i++) {
        dailyForecastList.value
            .add(DailyForecast(condTxtD: '???', condCodeD: '999', tmpMin: '--', tmpMax: '--', date: '2019-05-2$i 13:23:10'));
      }
    });
  }

  // 实况天气
  Future _getNow() async {
    var result = await Http().get('/weather/now', {
      'location': cid,
      'lang': D9l().lang,
      'key': Http.key,
    });

    if (result != null) {
      status = result['HeWeather6'].first['status'];
      if (status == 'ok') {
        basic.update((val) {
          basic = Rx(Basic.fromJson(result['HeWeather6'].first['basic']));
        });
        updateM.update((val) {
          updateM = Rx(Update.fromJson(result['HeWeather6'].first['update']));
        });
        now.update((val) {
          now = Rx(Now.fromJson(result['HeWeather6'].first['now']));
        });
      }
    }
  }

  // 获取近三天天气预报
  Future _getForecast() async {
    var result = await Http().get('/weather/forecast', {
      'location': cid,
      'lang': D9l().lang,
      'key': Http.key,
    });

    if (result != null) {
      status = result['HeWeather6'].first['status'];
      if (status == 'ok') {
        dailyForecastList.value.clear();
        dailyForecastList.update((val) {
          for (var v in result['HeWeather6'].first['daily_forecast']) {
            dailyForecastList.value.add(DailyForecast.fromJson(v));
          }
        });
      }
    }
  }

  // 生活指数
  Future _getLifeStyle() async {
    var result = await Http().get('/weather/lifestyle?location=$cid&key=${Http.key}', null);

    try {
      if (result != null) {
        status = result['HeWeather6'].first['status'];
        if (status == 'ok') {
          lifeStyleList.value.clear();
          lifeStyleList.update((val) {
            for (var v in result['HeWeather6'].first['lifestyle']) {
              lifeStyleList.value.add(LifeStyle.fromJson(v));
            }
          });
        }
      }
    } catch (e) {
      print('getLifeStyle error= $e');
    }
  }

  // 空气质量
  Future _getAirQuality() async {
    var result = await Http().get('/air/now', {
      'location': cid,
      'lang': D9l().lang,
      'key': Http.key,
    });

    if (result != null) {
      status = result['HeWeather6'].first['status'];
      if (status == 'ok') {
        airQuality.update((val) {
          airQuality = Rx(AirQuality.fromJson(result['HeWeather6'].first['air_now_city']));
        });
      }
    }
  }
}
