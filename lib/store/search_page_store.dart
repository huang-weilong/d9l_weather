import 'package:mobx/mobx.dart';

import '../dio_client.dart';
import '../model.dart';
part 'search_page_store.g.dart';

class SearchPageStore = SearchPageBase with _$SearchPageStore;

/// 命令行运行 flutter packages pub run build_runner build
/// flutter packages pub run build_runner watch

/// 全局 counter 对象
final SearchPageStore searchPageStore = SearchPageStore();

abstract class SearchPageBase implements Store {
  @observable
  List<Basic> cityList = [];

  @action
  void setCityList(List<Basic> list) {
    this.cityList = list;
  }

  @action
  void getCityList(String v) {
    DioClient().searchCity(v).then((result) {
      if (result != null) {
        setCityList(result);
      }
    });
  }
}
