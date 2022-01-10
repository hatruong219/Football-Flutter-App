import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Views/Account/Login/components/body.dart';
import 'package:flutter_app_demo/Views/Account/Signup/signup_screen.dart';
import 'package:flutter_app_demo/Views/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
String? finalEmail;
class SplashLoginScreen extends StatefulWidget {
  @override
  _SplashLoginScreenState createState() => _SplashLoginScreenState();
}
class _SplashLoginScreenState extends State<SplashLoginScreen> {
  @override
  void initState() {
    getValidation().whenComplete(() async{
      finalEmail == null?
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return SignUpScreen();
          },
        ),
      )
      :Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) {
        return MainScreen();
      }));
    });
    super.initState();
  }
  Future getValidation() async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obi = sharedPreferences.getString("user");
    setState(() {
      finalEmail = obi;
    });
    print("Bibi: "+ finalEmail!);

  }

  Widget build(BuildContext context) {
    return Center(
      child: Text("Loading...."),
    );
  }
}
