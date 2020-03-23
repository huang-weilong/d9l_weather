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

  // 搜索城市
  @action
  Future getCityList(String v) async {
    var result = await Http().get('https://search.heweather.net/find', {
      'location': v,
      'lang': D9l().lang,
      'key': Http.key,
      'mode': '',
      'number': 20,
    });

    if (result != null) {
      String status = result['HeWeather6'].first['status'];
      if (status == 'ok') {
        cityList.clear();
        for (var c in result['HeWeather6'].first['basic']) {
          cityList.add(Basic.fromJson(c));
        }
      }
    }
  }
}
