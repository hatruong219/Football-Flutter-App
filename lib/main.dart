import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Views/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Score App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const MainScreen(),
    );
  }
}
