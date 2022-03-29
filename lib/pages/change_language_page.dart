import 'package:d9l_weather/store/home_store.dart';

import '../utils/d9l.dart';
import '../utils/sp_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeLanguagePage extends StatefulWidget {
  @override
  _ChangeLanguagePageState createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('change_language'.tr),
        elevation: 0.0,
        centerTitle: true,
      ),
      backgroundColor: Color(0xffe3e3e3),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: ListTile(
                title: Text('Chinese'.tr),
                trailing: Get.locale == const Locale('zh', 'CN') ? const Icon(Icons.check, color: Colors.blue) : null,
                onTap: () async {
                  var locale = const Locale('zh', 'CN');
                  Get.updateLocale(locale);
                  SpClient.setString('lang', 'zh');
                  D9l().lang = 'zh';
                  await Future.delayed(Duration(milliseconds: 10));
                  HomeController homeController = Get.find();
                  homeController.getWeather();
                  setState(() {});
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 1.0),
              color: Colors.white,
              child: ListTile(
                title: Text('English'.tr),
                trailing: Get.locale == const Locale('en', 'US') ? const Icon(Icons.check, color: Colors.blue) : null,
                onTap: () async {
                  var locale = const Locale('en', 'US');
                  Get.updateLocale(locale);
                  SpClient.setString('lang', 'en');
                  D9l().lang = 'en';
                  await Future.delayed(Duration(milliseconds: 10));
                  HomeController homeController = Get.find();
                  homeController.getWeather();
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
