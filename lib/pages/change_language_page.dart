import 'package:d9l_weather/d9l.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChangeLanguagePage extends StatefulWidget {
  @override
  _ChangeLanguagePageState createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).tr('change_language')),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                data.changeLocale(Locale("zh", "CN"));
                D9l().lang = 'zh';
              },
              child: Text(AppLocalizations.of(context).tr('Chinese')),
            ),
            RaisedButton(
              onPressed: () {
                data.changeLocale(Locale("en", "US"));
                D9l().lang = 'en';
              },
              child: Text(AppLocalizations.of(context).tr('English')),
            ),
          ],
        ),
      ),
    );
  }
}
