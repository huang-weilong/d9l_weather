import 'package:d9l_weather/models/model.dart';
import 'package:d9l_weather/utils/d9l.dart';
import 'package:d9l_weather/utils/http.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  Rx<List<Basic>> cityList = RxList<Basic>().obs;

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
        cityList.value.clear();
        cityList.update((val) {
          for (var c in result['HeWeather6'].first['basic']) {
            cityList.value.add(Basic.fromJson(c));
          }
        });
      }
    }
  }
}
