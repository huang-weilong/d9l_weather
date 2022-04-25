import 'package:d9l_weather/store/home_store.dart';
import 'package:d9l_weather/store/search_store.dart';
import 'package:d9l_weather/store/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchController searchController = Get.find();
  ThemesController themesController = Get.find();

  @override
  void dispose() {
    searchController.cityList.value.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: PreferredSize(
        child: Obx(
          () => Container(
            color: themesController.themesColor[themesController.currentTheme.value],
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
                      hintText: 'city_name'.tr,
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    onChanged: (v) {
                      if (v != '') searchController.getCityList(v);
                    },
                  ),
                ),
                IconButton(
                  icon: Text('cancel'.tr, style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ),
        preferredSize: Size.fromHeight(56.0),
      ),
      body: Obx(
        () => ListView(
          children: searchController.cityList.value.map((item) {
            return InkWell(
              onTap: () {
                HomeController homeController = Get.find();
                homeController.cid = item.cid!;
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
