import 'package:d9l_weather/lang/langs.dart';
import 'package:d9l_weather/store/home_store.dart';
import 'package:d9l_weather/store/search_store.dart';
import 'package:d9l_weather/store/themes.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'utils/d9l.dart';
import 'package:d9l_weather/pages/home_page.dart';
import 'utils/sp_client.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initGetController();

  Future.wait([initializeDateFormatting(), SpClient.getInstance()]).then((_) async {
    if (SpClient.getString('cid') == null) {
      SpClient.setString('cid', 'CN101280101'); // 第一次安装APP默认显示广州天气
    }
    HomeController h = Get.find();
    h.cid = SpClient.getString('cid');
    D9l().lang = SpClient.getString('lang') ?? 'zh';

    // 初始化语言
    Locale locale;
    if (D9l().lang == 'zh')
      locale = Locale('zh', 'CN');
    else
      locale = Locale('en', 'US');
    await h.getWeather();

    // 初始化主题
    ThemesController t = Get.find();
    int themesIndex = SpClient.getInt('themeIndex') ?? 0;
    t.setCurrentTheme(themesIndex);

    runApp(GetMaterialApp(
      translations: Language(),
      locale: locale,
      fallbackLocale: const Locale('zh', 'CN'),
      home: HomePage(),
      theme: ThemeData.from(colorScheme: ColorScheme.light(primary: t.themesColor[themesIndex])),
    ));
  });
}

void initGetController() {
  Get.put(HomeController());
  Get.put(SearchController());
  Get.put(ThemesController());
}
