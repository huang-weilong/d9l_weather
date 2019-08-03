import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('关于'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.blue.withOpacity(0.9),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('ver 1.0.0'),
            Text('GitHub：https://github.com/huang-weilong'),
          ],
        ),
      ),
    );
  }
}
