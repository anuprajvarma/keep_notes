import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:keep_notes/constants/colorScheme.dart';
import 'package:keep_notes/screens/home.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: AppColorScheme.yellow,
        scaffoldBackgroundColor: AppColorScheme.dark,
        primaryColor: AppColorScheme.dark,
      ),
      home: SafeArea(child: Home()),
    );
  }
}
