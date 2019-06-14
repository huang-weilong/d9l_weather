import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';

import '../dio_client.dart';
import '../model.dart';
import '../sp_client.dart';
part 'home_page_store.g.dart';

class HomePageStore = HomePageBase with _$HomePageStore;

/// 命令行运行 flutter packages pub run build_runner build
/// flutter packages pub run build_runner watch

/// 全局 counter 对象
final HomePageStore homePageStore = HomePageStore();

abstract class HomePageBase implements Store {
  @observable
  String cid;

  @observable
  RealTimeWeather realTimeWeather;

  @observable
  List<DailyForecast> dailyForecastList = [];

  @action
  void setCid(String value) {
    this.cid = value;
  }

  @action
  void setRealTimeWeather(RealTimeWeather value) {
    this.realTimeWeather = value;
  }

  @action
  void setDailyForecastList(List<DailyForecast> value) {
    this.dailyForecastList = value;
  }

  @action
  Future<bool> updateWeather() async {
    bool flag = true;
    await DioClient().getRealTimeWeather(cid).then((v) {
      if (v != null) {
        if (v.status.contains('permission')) {
          Fluttertoast.showToast(msg: '没有权限');
          cid = SpClient.sp.getString('cid');
          return;
        }
        SpClient.sp.setString('cid', cid);
        setRealTimeWeather(v);
      } else {
        flag = false;
      }
    });

    await DioClient().getThreeDaysForecast(cid).then((v) {
      if (v != null) {
        setDailyForecastList(v.dailyForecasts);
      } else {
        flag = false;
      }
    });
    return flag;
  }
}
