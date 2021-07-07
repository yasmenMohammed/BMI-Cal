import 'package:flutter/material.dart';
import 'screens/screen1.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Input(),
        theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF090C21),
          scaffoldBackgroundColor: Color(0xFF090C21),
          textTheme: TextTheme(
            bodyText1: TextStyle(
              color: Color(0xFFFFFFFF),
            ),
          ),
        ));
  }
}
