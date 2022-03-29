import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ThemesController extends GetxController {
  var currentTheme = 0.obs;

  List<Color> themesColor = const [
    Color(0xff3389ff),
    Color(0xff6a8a62),
    Color(0xffec905d),
    Color(0xffe766b8),
    Color(0xff5b5b5b),
  ];

  void setCurrentTheme(int c) {
    currentTheme.value = c;
  }
}
