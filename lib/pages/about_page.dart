import 'package:easy_localization/easy_localization_delegate.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).tr('about')),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xff6994bd),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
//            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                AppLocalizations.of(context).tr('description'),
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 30.0),
              Text('GitHub: https://github.com/huang-weilong', textScaleFactor: 0.9),
              SizedBox(height: 10.0),
              RichText(
                textScaleFactor: 0.9,
                text: TextSpan(
                  style: TextStyle(color: Color(0xff333333)),
                  text: AppLocalizations.of(context).tr('jianshu'),
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
