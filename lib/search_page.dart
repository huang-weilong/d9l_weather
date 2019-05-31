import 'package:d9l_weather/dio_client.dart';
import 'package:d9l_weather/model.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Basic> cityList = [];

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: PreferredSize(
        child: Container(
          color: Colors.blue.withOpacity(0.6),
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
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(0.0),
                    isDense: true,
                    hintText: '城市名称中文/拼音',
                  ),
                  onChanged: (v) {
                    DioClient().searchCity(v).then((result) {
                      if (result != null && this.mounted) {
                        setState(() {
                          cityList = result;
                        });
                      }
                    });
                  },
                ),
              ),
              IconButton(
                icon: Text('取消'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
        preferredSize: Size.fromHeight(56.0),
      ),
      body: ListView(
        children: cityList.map((item) {
          return InkWell(
            onTap: () {
              Navigator.pop(context, item.cid);
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
    );
  }
}
