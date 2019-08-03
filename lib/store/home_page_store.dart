import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';

import 'package:d9l_weather/api/api.dart';
import 'package:d9l_weather/models/model.dart';
import '../sp_client.dart';
part 'home_page_store.g.dart';

class HomePageStore = HomePageBase with _$HomePageStore;

/// 命令行运行 flutter packages pub run build_runner build
/// flutter packages pub run build_runner watch

/// 全局 homePageStore 对象
final HomePageStore homePageStore = HomePageStore();

abstract class HomePageBase implements Store {
  @observable
  bool isNoNetwork = false;

  @observable
  String cid;

  @observable
  RealTimeWeather realTimeWeather;

  @observable
  ObservableList<DailyForecast> dailyForecastList = ObservableList<DailyForecast>();

  @action
  void setNetworkStatus(bool value) {
    this.isNoNetwork = value;
  }

  @action
  void _setCid(String value) {
    this.cid = value;
  }

  @action
  void setRealTimeWeather(RealTimeWeather value) {
    this.realTimeWeather = value;
  }

  @action
  void addDailyForecast(DailyForecast value) {
    this.dailyForecastList.add(value);
  }

  @action
  void clearDailyForecast() {
    this.dailyForecastList.clear();
  }

  @action
  Future<void> updateWeather(String cid) async {
    RealTimeWeather v = await Api().getRealTimeWeather(cid);

    if (v != null) {
      if (v.status.contains('permission')) {
        Fluttertoast.showToast(msg: '没有权限');
        return;
      } else if (v.status.contains('unknown')) {
        Fluttertoast.showToast(msg: '无法查询该地址天气');
        return;
      } else if (v.status.contains('no more')) {
        _setEmptyData('查询次数超上限');
        return;
      }
      SpClient.sp.setString('cid', cid);
      _setCid(cid);
      setRealTimeWeather(v);
    }

    await Api().getThreeDaysForecast(cid).then((v) {
      if (v != null) {
        clearDailyForecast();
        for (var d in v.dailyForecasts) {
          addDailyForecast(d);
        }
      }
    });

    if (this.realTimeWeather == null) {
      _setEmptyData('未知');
    } else {
      Fluttertoast.showToast(msg: '更新成功');
    }
  }

  @action
  void _setEmptyData(String title) {
    RealTimeWeather _noNetworkWeather = RealTimeWeather(
      basic: Basic(location: title),
      now: Now(tmp: 'N/A', condTxt: '', windDir: '--', hum: '--', pres: '--'),
    );
    List<DailyForecast> _noNetworkForecastList = [
      DailyForecast(condTxtD: '???', condCodeD: '999', tmpMin: '--', tmpMax: '--', date: '2019-05-27 13:23:10'),
      DailyForecast(condTxtD: '???', condCodeD: '999', tmpMin: '--', tmpMax: '--', date: '2019-05-28 13:23:10'),
      DailyForecast(condTxtD: '???', condCodeD: '999', tmpMin: '--', tmpMax: '--', date: '2019-05-29 13:23:10'),
    ];
    setRealTimeWeather(_noNetworkWeather);
    clearDailyForecast();
    for (var v in _noNetworkForecastList) {
      addDailyForecast(v);
    }
  }
}
