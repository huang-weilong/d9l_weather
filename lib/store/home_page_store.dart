import 'package:d9l_weather/d9l.dart';
import 'package:d9l_weather/utils/http.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';

import 'package:d9l_weather/models/model.dart';
import '../sp_client.dart';

part 'home_page_store.g.dart';

class HomePageStore = HomePageBase with _$HomePageStore;

/// 命令行运行 flutter packages pub run build_runner build
/// flutter packages pub run build_runner watch

/// 全局 homePageStore 对象
final HomePageStore homePageStore = HomePageStore();

abstract class HomePageBase with Store {
  @observable
  Basic basic;
  @observable
  Update update;
  @observable
  Now now;
  String status;
  String cid;
  @observable
  ObservableList<DailyForecast> dailyForecastList = ObservableList<DailyForecast>();
  @observable
  ObservableList<LifeStyle> lifeStyleList = ObservableList<LifeStyle>();
  @observable
  AirQuality airQuality;
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

  @action
  Future<bool> getWeather() async {
//    status = null;

    await _getNow();
    await _getForecast();
    await _getAirQuality();
    await _getLifeStyle();

    if (status != null) {
      if (status.contains('permission')) {
        this.cid = SpClient.sp.getString('cid');
        Fluttertoast.showToast(msg: D9l.toastStr[D9l().lang]['permission']);
        return false;
      } else if (status.contains('unknown')) {
        this.cid = SpClient.sp.getString('cid');
        Fluttertoast.showToast(msg: D9l.toastStr[D9l().lang]['unknown']);
        return false;
      } else if (status.contains('no more')) {
        this.cid = SpClient.sp.getString('cid');
        Fluttertoast.showToast(msg: D9l.toastStr[D9l().lang]['no_more_requests']);
        _setEmptyData();
        return false;
      }
      SpClient.sp.setString('cid', cid);
      return true;
    } else {
      _setEmptyData();
      return false;
    }
  }

  void _setEmptyData() {
    basic = Basic(location: '??');
    now = Now(tmp: '??', pres: '??', windDir: '??', hum: '??', fl: '??', condTxt: '??');
    dailyForecastList.clear();
    for (int i = 0; i < 3; i++) {
      dailyForecastList.add(DailyForecast(condTxtD: '???', condCodeD: '999', tmpMin: '--', tmpMax: '--', date: '2019-05-2$i 13:23:10'));
    }
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
        basic = Basic.fromJson(result['HeWeather6'].first['basic']);
        update = Update.fromJson(result['HeWeather6'].first['update']);
        now = Now.fromJson(result['HeWeather6'].first['now']);
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
        dailyForecastList.clear();
        for (var v in result['HeWeather6'].first['daily_forecast']) {
          dailyForecastList.add(DailyForecast.fromJson(v));
        }
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
          lifeStyleList.clear();
          for (var v in result['HeWeather6'].first['lifestyle']) {
            lifeStyleList.add(LifeStyle.fromJson(v));
          }
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
        airQuality = AirQuality.fromJson(result['HeWeather6'].first['air_now_city']);
      }
    }
  }
}
