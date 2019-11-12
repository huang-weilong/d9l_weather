import 'package:mobx/mobx.dart';

import 'package:d9l_weather/api/api.dart';
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
    Api().searchCity(v).then((result) {
      if (result != null) {
        clearCityList();
        for (var v in result) {
          addCity(v);
        }
      }
    });
  }

  @override
  void dispose() {}
}
