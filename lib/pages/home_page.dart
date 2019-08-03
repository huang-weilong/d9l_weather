import 'package:d9l_weather/models/model.dart';
import 'package:d9l_weather/pages/search_page.dart';
import 'package:d9l_weather/store/home_page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:d9l_weather/pages/about_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Colors.blue, Colors.blue.withOpacity(0.4)],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 100.0),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Observer(
                    builder: (_) => Text(
                          homePageStore.realTimeWeather.basic.location,
                          style: TextStyle(fontSize: 40.0, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Observer(
                        builder: (_) => Text(
                              '${homePageStore.realTimeWeather.now.tmp}°',
                              style: TextStyle(fontSize: 80.0, color: Colors.white),
                            ),
                      ),
                      Observer(
                        builder: (_) => Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                homePageStore.realTimeWeather.now.condCode == null
                                    ? Container()
                                    : Image.asset('assets/images/weather/${homePageStore.realTimeWeather.now.condCode}.png',
                                        color: Colors.white),
                                SizedBox(height: 10.0),
                                Text(
                                  '${homePageStore.realTimeWeather.now.condTxt}',
                                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                                ),
                              ],
                            ),
                      ),
                    ],
                  ),
                ),
                Observer(
                  builder: (_) => Expanded(
                        child: homePageStore.isNoNetwork
                            ? Align(
                                alignment: Alignment.center,
                                child: Text('请检查你的网络状态', style: TextStyle(color: Colors.white, fontSize: 20.0)),
                              )
                            : Container(),
                      ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Observer(
                    builder: (_) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _someMessage(
                              icon: 'assets/images/wind_direction.png',
                              title: '风向',
                              data: homePageStore.realTimeWeather.now.windDir,
                            ),
                            _someMessage(
                              icon: 'assets/images/humidity.png',
                              title: '湿度',
                              data: homePageStore.realTimeWeather.now.hum + '%',
                            ),
                            _someMessage(
                              icon: 'assets/images/air_pressure.png',
                              title: '气压',
                              data: homePageStore.realTimeWeather.now.pres + 'hpa',
                            ),
                          ],
                        ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: Observer(
                    builder: (_) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: homePageStore.dailyForecastList.map((item) {
                            return _threeDayWeather(item);
                          }).toList(),
                        ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 6.0),
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: Text('d9lweather', style: TextStyle(color: Color(0xffe2e2e2))),
                ),
              ],
            ),
          ),
          RefreshIndicator(
            onRefresh: _pullDownRefresh,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              child: Center(child: SizedBox(height: 500.0)),
            ),
          ),
          Positioned(
            top: 27.0,
            right: 0.0,
            child: IconButton(
              icon: Image.asset('assets/images/setting.png'),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          title: Text('切换城市'),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(context, CupertinoPageRoute(builder: (_) => SearchPage())).then((result) {
                              if (result != null) {
                                homePageStore.updateWeather(result);
                              }
                            });
                          },
                        ),
                        Divider(height: 0.0),
                        ListTile(
                          title: Text('选择语言'),
                          onTap: () {
                            Navigator.pop(context);
                            Fluttertoast.showToast(msg: '暂时不能选择语言');
                          },
                        ),
                        Divider(height: 0.0),
                        ListTile(
                          title: Text('关于'),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(context, CupertinoPageRoute(builder: (_) => AboutPage()));
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _threeDayWeather(DailyForecast dailyForecast) {
    String date = DateFormat('EE', 'zh_CN').format(
      DateTime.parse(dailyForecast.date),
    );
    return Column(
      children: <Widget>[
        Text(date, style: TextStyle(color: Color(0xff8a8a8a))),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: Image.asset('assets/images/weather/${dailyForecast.condCodeD}.png', color: Colors.blue),
        ),
        Text(dailyForecast.condTxtD, style: TextStyle(color: Color(0xff8a8a8a))),
        Padding(
          padding: EdgeInsets.only(top: 4.0),
          child: Text(dailyForecast.tmpMin + '℃~' + dailyForecast.tmpMax + '℃', style: TextStyle(color: Color(0xff8a8a8a))),
        ),
      ],
    );
  }

  Widget _someMessage({String icon, String title, String data}) {
    return Row(
      children: <Widget>[
        Image.asset(icon, width: 30.0, fit: BoxFit.fill),
        Column(
          children: <Widget>[
            Text(title, style: TextStyle(color: Colors.white)),
            Text(data, style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    );
  }

  // refresh
  Future<void> _pullDownRefresh() async {
    await homePageStore.updateWeather(homePageStore.cid);
  }
}
