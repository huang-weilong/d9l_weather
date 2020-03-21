import 'package:d9l_weather/d9l.dart';
import 'package:d9l_weather/utils/http.dart';
import 'package:mobx/mobx.dart';

import 'package:d9l_weather/models/model.dart';

part 'search_page_store.g.dart';

class SearchPageStore = SearchPageBase with _$SearchPageStore;

/// 命令行运行 flutter packages pub run build_runner build
/// flutter packages pub run build_runner watch

/// 全局 searchPageStore 对象
final SearchPageStore searchPageStore = SearchPageStore();

abstract class SearchPageBase with Store {
  @observable
  ObservableList<Basic> cityList = ObservableList<Basic>();

  @action
  void addCity(Basic city) {
    this.cityList.add(city);
  }

  @action
  void clearCityList() {
    this.cityList.clear();
  }

  @action
  void getCityList(String v) {
    // 搜索城市
    Http().get('https://search.heweather.net/find', {
      'location': v,
      'lang': D9l().lang,
      'key': Http.key,
      'mode': '',
      'number': 20,
    }).then((result) {
      if (result != null) {
        List<Basic> cityList = [];
        if (result['HeWeather6'] != null) {
          for (var c in result['HeWeather6'].first['basic']) {
            cityList.add(Basic.fromJson(c));
          }
        }
        clearCityList();
        for (var v in cityList) {
          addCity(v);
        }
      }
    });
  }
}
