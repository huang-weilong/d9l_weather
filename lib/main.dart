import 'package:d9l_weather/d9l.dart';
import 'package:d9l_weather/pages/home_page.dart';
import 'package:d9l_weather/sp_client.dart';
import 'package:d9l_weather/store/themes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'store/home_page_store.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Future.wait([SpClient.getInstance()]).then((_) async {
    if (SpClient.sp.getString('cid') == null) {
      SpClient.sp.setString('cid', 'CN101280101'); // 第一次安装APP默认显示广州天气
    }
    homePageStore.cid = SpClient.sp.getString('cid');
    D9l().lang = SpClient.sp.getString('lang') ?? 'zh';
    await homePageStore.getWeather();
    runApp(EasyLocalization(
      path: 'assets/langs',
      supportedLocales: [Locale('en', 'US'), Locale('zh', 'CN')],
      child: MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Themes()),
        // Provider(create: (_) => ThemeStore()),
      ],
      child: MaterialApp(
        key: navigatorKey,
        title: 'd9l weather',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
