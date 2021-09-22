import 'package:flutter/material.dart';
import 'package:keep_notes/constants/colorScheme.dart';
import 'package:keep_notes/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: AppColorScheme.yellow,
        scaffoldBackgroundColor: AppColorScheme.dark,
        primaryColor: AppColorScheme.dark,
      ),
      home: Home(),
    );
  }
}
