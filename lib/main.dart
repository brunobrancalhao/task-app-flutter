import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './widgets/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task App',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(49, 47, 100, 1),
          accentColor: Color.fromRGBO(252, 92, 99, 1),
          cupertinoOverrideTheme: CupertinoThemeData(
            barBackgroundColor: Color.fromRGBO(49, 47, 100, 1),
            textTheme: CupertinoTextThemeData(
              navTitleTextStyle: TextStyle(
                fontFamily: 'Playfair Display',
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            primaryColor: Colors.white,
          ),
          textTheme: TextTheme(
            // ignore: deprecated_member_use
            body1: TextStyle(fontFamily: 'Righteous'),
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Color.fromRGBO(49, 47, 100, 1),
          )),
      home: Home(),
    );
  }
}
