import 'package:d9l_weather/main.dart';
import 'package:d9l_weather/sp_client.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Themes with ChangeNotifier {
  static final Map<String, Color> colorMap1 = {
    'color1': Color(0xff375f84),
    'color2': Color(0xff8f5992),
    'color3': Color(0xff9e9575),
    'color4': Color(0xff6a8a62),
    'color5': Color(0xff343434),
  };
  static final Map<String, Color> colorMap2 = {
    'color1': Color(0xff6994bd),
    'color2': Color(0xffc77dcc),
    'color3': Color(0xffe0d3a8),
    'color4': Color(0xff92bc86),
    'color5': Color(0xff5b5b5b),
  };

  Color _primaryColor1 = colorMap1[SpClient.sp.getString('theme') ?? 'color1'];
  Color _primaryColor2 = colorMap2[SpClient.sp.getString('theme') ?? 'color1'];

  void changeTheme(String theme) {
    SpClient.sp.setString('theme', theme);
    _primaryColor1 = colorMap1[SpClient.sp.getString('theme')];
    _primaryColor2 = colorMap2[SpClient.sp.getString('theme')];
    notifyListeners();
  }

  static get primaryColor1 {
    return Provider.of<Themes>(navigatorKey.currentContext)._primaryColor1;
  }

  static get primaryColor2 {
    return Provider.of<Themes>(navigatorKey.currentContext)._primaryColor2;
  }
}
