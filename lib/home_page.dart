import 'package:d9l_weather/dio_client.dart';
import 'package:d9l_weather/model.dart';
import 'package:d9l_weather/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RealTimeWeather realTimeWeather;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset('assets/images/bg.png', fit: BoxFit.fill, width: width),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _fiveDayWeather('周一', '28℃'),
                    _fiveDayWeather('周二', '27℃'),
                    _fiveDayWeather('周三', '28℃'),
                    _fiveDayWeather('周四', '29℃'),
                    _fiveDayWeather('周五', '31℃'),
                  ],
                ),
                Text('d9lweather', style: TextStyle(color: Color(0xffe2e2e2))),
              ],
            ),
          ),
          RefreshIndicator(
            onRefresh: _pullDownRefresh,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 90.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '${realTimeWeather?.now?.condTxt ?? '未知'}',
                        style: TextStyle(fontSize: 34.0, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          realTimeWeather?.basic?.location ?? '未知',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${realTimeWeather?.now?.tmp ?? '0'}',
                              style: TextStyle(fontSize: 80.0, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            Text('℃', style: TextStyle(fontSize: 40.0, color: Colors.white, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      SizedBox(height: 330.0)
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 27.0,
            right: 0.0,
            child: IconButton(
              icon: Icon(Icons.add, color: Colors.white),
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (_) => SearchPage())).then((result) {
                  if (result != null) {
                    DioClient().getRealTimeWeather(result).then((v) {
                      if (v != null && this.mounted) {
                        setState(() {
                          realTimeWeather = v;
                        });
                      }
                    });
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _fiveDayWeather(String date, String temp) {
    return Column(
      children: <Widget>[
        Text(date, style: TextStyle(color: Color(0xff8a8a8a))),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Image.asset('assets/images/sunny.png'),
        ),
        Text(temp, style: TextStyle(color: Color(0xff8a8a8a))),
      ],
    );
  }

  // refresh
  Future<void> _pullDownRefresh() async {
    await Future.delayed(Duration(seconds: 3), () {
      print('refresh success');
    });
  }
}
