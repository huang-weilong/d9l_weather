import 'package:d9l_weather/dio_client.dart';
import 'package:d9l_weather/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  DioClient();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'd9l weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
