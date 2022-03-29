import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('about'.tr),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'description'.tr,
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 30.0),
              Text('GitHub: https://github.com/huang-weilong', textScaleFactor: 0.9),
              SizedBox(height: 10.0),
              RichText(
                textScaleFactor: 0.9,
                text: TextSpan(
                  style: TextStyle(color: Color(0xff333333)),
                  text: 'jianshu'.tr,
                  children: [TextSpan(text: ': https://www.jianshu.com/p/e8e535952291')],
                ),
              ),
              SizedBox(height: 10.0),
              Text('ver 1.0.0'),
            ],
          ),
        ),
      ),
    );
  }
}
