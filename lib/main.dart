import 'package:d9l_weather/api/api.dart';
import 'package:d9l_weather/pages/home_page.dart';
import 'package:d9l_weather/sp_client.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'store/home_page_store.dart';

void main() {
  Future.wait([initializeDateFormatting("zh_CN", null), SpClient.getInstance()]).then((_) async {
    if (SpClient.sp.getString('cid') == null) {
      SpClient.sp.setString('cid', 'CN101280101'); // 第一次安装APP默认显示广州天气
    }
    homePageStore.setCid(SpClient.sp.getString('cid'));
    await homePageStore.updateWeather(homePageStore.cid);
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
