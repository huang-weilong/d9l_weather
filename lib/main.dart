import 'package:d9l_weather/pages/home_page.dart';
import 'package:d9l_weather/sp_client.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'store/home_page_store.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([SpClient.getInstance()]).then((_) async {
    if (SpClient.sp.getString('cid') == null) {
      SpClient.sp.setString('cid', 'CN101280101'); // 第一次安装APP默认显示广州天气
    }
    homePageStore.cid = SpClient.sp.getString('cid');
    await homePageStore.getWeather();
    runApp(EasyLocalization(child: MyApp()));
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: MaterialApp(
        title: 'd9l weather',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          EasylocaLizationDelegate(
            locale: data.locale,
            path: 'assets/langs', // 多语言路径
          ),
        ],
        supportedLocales: [Locale('en', 'US'), Locale('zh', 'CN')],
        locale: data.savedLocale,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
