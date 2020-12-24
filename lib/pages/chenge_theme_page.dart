import 'package:d9l_weather/sp_client.dart';
import 'package:d9l_weather/store/themes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeThemePage extends StatefulWidget {
  @override
  _ChangeThemePageState createState() => _ChangeThemePageState();
}

class _ChangeThemePageState extends State<ChangeThemePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).tr('change_theme')),
        elevation: 0.0,
        backgroundColor: Themes.primaryColor1,
      ),
      body: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              AppLocalizations.of(context).tr('change_theme'),
              style: TextStyle(color: Themes.primaryColor1, fontSize: 16.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: Themes.colorMap1.keys.map((e) {
              return GestureDetector(
                onTap: () {
                  Provider.of<Themes>(context, listen: false).changeTheme(e);
                },
                child: Container(
                  color: Themes.colorMap1[e],
                  height: 50.0,
                  width: 50.0,
                  child: Icon(Icons.check, color: (SpClient.sp.getString('theme') ?? 'color1') == e ? Colors.white : Themes.colorMap1[e]),
                ),
              );
            }).toList(),
          ),
        ]),
      ),
    );
  }
}
