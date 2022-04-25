import 'package:d9l_weather/store/home_store.dart';
import 'package:d9l_weather/store/themes.dart';
import 'package:get/get.dart';

import '../utils/d9l.dart';
import 'package:d9l_weather/pages/about_page.dart';
import 'package:d9l_weather/pages/change_language_page.dart';
import 'package:d9l_weather/pages/chenge_theme_page.dart';
import 'package:d9l_weather/pages/search_page.dart';
import '../utils/sp_client.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  final HomeController homeController = Get.find();
  final ThemesController themesController = Get.find();

  @override
  Widget build(BuildContext context) {
    SpClient.setString('lang', D9l().lang);

    return Scaffold(
      body: Obx(
        () => Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          color: themesController.themesColor[themesController.currentTheme.value],
          child: RefreshIndicator(
            onRefresh: _pullDownRefresh,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Text(
                          '${homeController.basic.value.location}',
                          style: TextStyle(fontSize: 32.0, color: Colors.white),
                        ),
                      ),
                      IconButton(
                        icon: Image.asset('assets/images/setting.png'),
                        onPressed: () {
                          onSetting(context);
                        },
                      )
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(color: Colors.white),
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Text(
                          homeController.now.value.tmp!,
                          style: TextStyle(fontSize: 100.0, color: Colors.white),
                        ),
                      ),
                      TextSpan(text: '℃', style: TextStyle(fontSize: 40.0)),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                Text('${homeController.dailyForecastList.value.first.tmpMin}~${homeController.dailyForecastList.value.first.tmpMax}℃',
                    style: TextStyle(fontSize: 20.0, color: Colors.white), textAlign: TextAlign.center),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(text: homeController.now.value.condTxt, children: [
                    TextSpan(text: '  |  '),
                    TextSpan(text: '${'air'.tr}  ${homeController.airQuality.value.qlty}·${homeController.airQuality.value.aqi}')
                  ]),
                ),
                SizedBox(height: 30.0),
                _threeDayWeather(),
                SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                    color: Color(0x33ffffff),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: <Widget>[
                      _centerWidget(
                        icon: 'assets/images/wind_direction.png',
                        title: 'wind'.tr,
                        data: '${homeController.now.value.windDir}',
                      ),
                      _centerWidget(
                        icon: 'assets/images/humidity.png',
                        title: 'humidity'.tr,
                        data: '${homeController.now.value.hum}%',
                      ),
                      _centerWidget(
                        icon: 'assets/images/air_pressure.png',
                        title: 'pressure'.tr,
                        data: '${homeController.now.value.pres}hpa',
                      ),
                      _centerWidget(
                        icon: 'assets/images/somatosensory.png',
                        title: 'apparent'.tr,
                        data: '${homeController.now.value.fl}℃',
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  padding: const EdgeInsets.only(bottom: 2.0),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text('lifestyle'.tr, style: TextStyle(fontSize: 16.0, color: Colors.white)),
                ),
                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  childAspectRatio: 1.6,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  children:
                      homeController.lifeStyleList.value.where((element) => homeController.lsType[element.type] != null).map((element) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Color(0x33ffffff),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(homeController.lsType[element.type], style: TextStyle(color: Colors.white)),
                          SizedBox(height: 3.0),
                          Text(element.brf!, style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('data_sources'.tr, style: TextStyle(color: Color(0xaac3c3c3))),
                      Text('d9l_weather', style: TextStyle(color: Color(0xaac3c3c3))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _centerWidget({required String icon, required String title, required String data}) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Image.asset(icon, width: 24.0, fit: BoxFit.fill),
          SizedBox(height: 4.0),
          Text(title, style: TextStyle(color: Colors.white)),
          SizedBox(height: 4.0),
          Text(data, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _threeDayWeather() {
    return Row(
      children: homeController.dailyForecastList.value.map((item) {
        String date = DateFormat('EE', D9l().lang).format(DateTime.parse(item.date!));
        return Expanded(
          child: Column(
            children: <Widget>[
              Text(date, style: TextStyle(color: Colors.white)),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Image.asset('assets/images/weather/${item.condCodeD}.png', color: Colors.white),
              ),
              Text(item.condTxtD!, style: TextStyle(color: Colors.white)),
              Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Text(item.tmpMin! + '℃~' + item.tmpMax! + '℃', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  void onSetting(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text('change_city'.tr),
              onTap: () {
                Get.back();
                Get.to(SearchPage())?.then((value) {
                  if (value == true) {
                    HomeController homeController = Get.find();
                    homeController.getWeather();
                  }
                });
              },
            ),
            Divider(height: 0.0),
            ListTile(
              title: Text('change_language'.tr),
              onTap: () {
                Get.back();
                Get.to(ChangeLanguagePage());
              },
            ),
            Divider(height: 0.0),
            ListTile(
              title: Text('change_theme'.tr),
              onTap: () {
                Get.back();
                Get.to(ChangeThemePage());
              },
            ),
            Divider(height: 0.0),
            ListTile(
              title: Text('about'.tr),
              onTap: () {
                Get.back();
                Get.to(AboutPage());
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _pullDownRefresh() async {
    bool result = await homeController.getWeather();
    if (result) Fluttertoast.showToast(msg: D9l.toastStr[D9l().lang]['update']);
  }
}
