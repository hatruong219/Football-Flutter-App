import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Views/Account/Login/components/background.dart';
import "package:flutter_app_demo/Views/Account/Signup/signup_screen.dart";
import 'package:flutter_app_demo/Views/Account/components/already_have_an_account_acheck.dart';
import 'package:flutter_app_demo/Views/Account/components/rounded_button.dart';
import 'package:flutter_app_demo/Views/Account/components/rounded_input_field.dart';
import 'package:flutter_app_demo/Views/Account/components/rounded_password_field.dart';
import 'package:flutter_app_demo/Views/main_screen.dart';
import 'package:flutter_app_demo/Views/splash_login_screen.dart';
import 'package:flutter_app_demo/api/api.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  bool checkLogin = false;
  signIn(String email, String password) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map body = {"email": email, "password": password};
    print("body"+ body.toString());
    var jsonResponse;
    var res = await http.post(Uri.parse(
      '$linkApi/api/auth/login'
    ), body: body);
    if(res.statusCode == 200){
      jsonResponse = json.decode(res.body);
      print("Respone status: ${res.statusCode}");
      print("Respone body: ${res.body}");

      if(jsonResponse != null){
        setState(() {
          _isLoading = false;
          checkLogin = true;
        });
        sharedPreferences.setString("user", jsonResponse["email"]);
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (BuildContext context) => SplashLoginScreen()),
            (Route<dynamic> route) => false);
      }
    }
    else{
      setState(() {
        _isLoading = false;
      });
      print("Respone body: ${res.body}");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              controller: _emailController,
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              controller: _passwordController,
              onChanged: (value) {},

            ),
            RoundedButton(
              text: "LOGIN",
              press: _emailController =="" || _passwordController ==""
                  ?null
                  :(){
                    setState(() {
                      _isLoading = true;
                    });
                    signIn(_emailController.text, _passwordController.text);
                  },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
