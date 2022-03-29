import 'package:d9l_weather/store/home_store.dart';
import 'package:d9l_weather/store/themes.dart';
import 'package:get/get.dart';

import '../utils/d9l.dart';
import 'package:d9l_weather/models/model.dart';
import 'package:d9l_weather/pages/about_page.dart';
import 'package:d9l_weather/pages/change_language_page.dart';
import 'package:d9l_weather/pages/chenge_theme_page.dart';
import 'package:d9l_weather/pages/search_page.dart';
import '../utils/sp_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SpClient.setString('lang', D9l().lang);
    HomeController homeController = Get.find();
    ThemesController themesController = Get.find();

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Themes.primaryColor2(context),
        elevation: 0.0,
        title: Obx(
          () => Text(
            '${homeController.basic.value.location}',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/images/setting.png'),
            onPressed: () {
              onSetting(context);
            },
          )
        ],
      ),
      body: Obx(
        () => Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          color: themesController.themesColor[themesController.currentTheme.value],
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.bottomCenter,
          //     end: Alignment.topCenter,
          //     colors: [Colors.blueAccent, Colors.blue],
          //   ),
          // ),
          child: RefreshIndicator(
            onRefresh: _pullDownRefresh,
            child: ListView(
              children: <Widget>[
                SizedBox(height: 20.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('${homeController.now.value.tmp}', style: TextStyle(fontSize: 140.0, color: Colors.white)),
                    Text('℃', style: TextStyle(fontSize: 70.0, color: Colors.white)),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('${homeController.now.value.condTxt}', style: TextStyle(fontSize: 32.0, color: Colors.white)),
                    Text('  |  ', style: TextStyle(color: Colors.white)),
                    Text(
                      '${'air'.tr}  ${homeController.airQuality.value.qlty}·${homeController.airQuality.value.aqi}',
                      style: TextStyle(fontSize: 22.0, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                Row(
                  children: homeController.dailyForecastList.value.map((item) => _threeDayWeather(item)).toList(),
                ),
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

  Widget _threeDayWeather(DailyForecast dailyForecast) {
    String date = DateFormat('EE', D9l().lang).format(DateTime.parse(dailyForecast.date!));
    return Expanded(
      child: Column(
        children: <Widget>[
          Text(date, style: TextStyle(color: Colors.white)),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Image.asset('assets/images/weather/${dailyForecast.condCodeD}.png', color: Colors.white),
          ),
          Text(dailyForecast.condTxtD!, style: TextStyle(color: Colors.white)),
          Padding(
            padding: EdgeInsets.only(top: 4.0),
            child: Text(dailyForecast.tmpMin! + '℃~' + dailyForecast.tmpMax! + '℃', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
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
                Navigator.pop(context);
                Navigator.push(context, CupertinoPageRoute(builder: (_) => SearchPage())).then((result) {
                  if (result == true) {
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
                Navigator.pop(context);
                Navigator.push(context, CupertinoPageRoute(builder: (_) => ChangeLanguagePage()));
              },
            ),
            Divider(height: 0.0),
            ListTile(
              title: Text('change_theme'.tr),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, CupertinoPageRoute(builder: (_) => ChangeThemePage()));
              },
            ),
            Divider(height: 0.0),
            ListTile(
              title: Text('about'.tr),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, CupertinoPageRoute(builder: (_) => AboutPage()));
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _pullDownRefresh() async {
    HomeController homeController = Get.find();
    bool result = await homeController.getWeather();
    if (result) Fluttertoast.showToast(msg: D9l.toastStr[D9l().lang]['update']);
  }
}
