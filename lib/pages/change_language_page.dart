import 'package:d9l_weather/d9l.dart';
import 'package:d9l_weather/sp_client.dart';
import 'package:d9l_weather/store/home_page_store.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChangeLanguagePage extends StatefulWidget {
  @override
  _ChangeLanguagePageState createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('change_language'.tr()),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Color(0xff6994bd),
      ),
      backgroundColor: Color(0xffe3e3e3),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: ListTile(
                title: Text('Chinese'.tr()),
                trailing: D9l().lang == 'zh' ? Icon(Icons.check, color: Colors.green) : null,
                onTap: () {
                  context.setLocale(Locale("zh", "CN"));
                  D9l().lang = 'zh';
                  SpClient.sp.setString('lang', 'zh');
                  homePageStore.getWeather();
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 1.0),
              color: Colors.white,
              child: ListTile(
                title: Text('English'.tr()),
                trailing: D9l().lang == 'en' ? Icon(Icons.check, color: Colors.green) : null,
                onTap: () {
                  context.setLocale(Locale("en", "US"));
                  D9l().lang = 'en';
                  SpClient.sp.setString('lang', 'en');
                  homePageStore.getWeather();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
