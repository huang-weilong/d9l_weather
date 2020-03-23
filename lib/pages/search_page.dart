import 'package:d9l_weather/store/home_page_store.dart';
import 'package:d9l_weather/store/search_page_store.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void dispose() {
    searchPageStore.cityList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: PreferredSize(
        child: Container(
          color: Color(0xff6994bd),
          padding: EdgeInsets.only(top: statusBarHeight, left: 10.0, right: 10.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Image.asset('assets/images/search.png', width: 20.0, color: Colors.white),
              ),
              Flexible(
                child: TextField(
                  scrollPadding: EdgeInsets.all(0.0),
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(0.0),
                    isDense: true,
                    hintText: AppLocalizations.of(context).tr('city_name'),
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  onChanged: (v) {
                    if (v != '') searchPageStore.getCityList(v);
                  },
                ),
              ),
              IconButton(
                icon: Text(AppLocalizations.of(context).tr('cancel'), style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
        preferredSize: Size.fromHeight(56.0),
      ),
      body: Observer(
        builder: (_) => ListView(
          children: searchPageStore.cityList.map((item) {
            return InkWell(
              onTap: () {
                homePageStore.cid = item.cid;
                Navigator.pop(context, true);
              },
              child: Container(
                padding: EdgeInsets.all(14.0),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xffd3d3d3), width: 0.5))),
                child: Text(
                  '${item.adminArea} - ${item.parentCity} - ${item.location}',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
