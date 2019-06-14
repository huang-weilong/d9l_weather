import 'package:d9l_weather/dio_client.dart';
import 'package:d9l_weather/home_page.dart';
import 'package:d9l_weather/sp_client.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'store/home_page_store.dart';

void main() {
  Future.wait([initializeDateFormatting("zh_CN", null), SpClient.getInstance()]).then((_) async {
    DioClient();
    if (SpClient.sp.getString('cid') == null) {
      SpClient.sp.setString('cid', 'CN101280101'); // 第一次安装APP默认显示广州天气
    }
    homePageStore.cid = SpClient.sp.getString('cid');
    await homePageStore.updateWeather();
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'd9l weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
