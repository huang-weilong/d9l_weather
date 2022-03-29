import 'package:d9l_weather/store/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeThemePage extends StatefulWidget {
  @override
  _ChangeThemePageState createState() => _ChangeThemePageState();
}

class _ChangeThemePageState extends State<ChangeThemePage> {
  @override
  Widget build(BuildContext context) {
    ThemesController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('change_theme'.tr),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('change_theme'.tr),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: controller.themesColor
                .map(
                  (e) => GestureDetector(
                    child: Obx(
                      () => Container(
                        height: 50.0,
                        width: 50.0,
                        color: e,
                        child: controller.currentTheme.value == controller.themesColor.indexOf(e)
                            ? const Icon(Icons.check, color: Colors.white)
                            : null,
                      ),
                    ),
                    onTap: () {
                      Get.changeTheme(ThemeData.from(colorScheme: ColorScheme.light(primary: e)));
                      controller.setCurrentTheme(controller.themesColor.indexOf(e));
                    },
                  ),
                )
                .toList(),
          ),
        ]),
      ),
    );
  }
}
