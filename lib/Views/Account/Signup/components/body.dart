import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Views/Account/Login/components/body.dart';
import 'package:flutter_app_demo/Views/Account/Login/login_screen.dart';
import 'package:flutter_app_demo/Views/Account/Signup/components/background.dart';
import 'package:flutter_app_demo/Views/Account/Signup/components/or_divider.dart';
import 'package:flutter_app_demo/Views/Account/Signup/components/social_icon.dart';
import 'package:flutter_app_demo/Views/Account/Welcome/components/body.dart';
import 'package:flutter_app_demo/Views/Account/components/already_have_an_account_acheck.dart';
import 'package:flutter_app_demo/Views/Account/components/rounded_button.dart';
import 'package:flutter_app_demo/Views/Account/components/rounded_input_field.dart';
import 'package:flutter_app_demo/Views/Account/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_app_demo/Views/splash_login_screen.dart';
import 'package:flutter_app_demo/api/api.dart';
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
  signUp(String email, String password) async{
    Map body = {"email": email, "password": password};
    print("body"+ body.toString());
    var jsonResponse;
    var res = await http.post(Uri.parse(
        '$linkApi/api/auth/register'
    ), body: body);
    if(res.statusCode == 200){
      jsonResponse = json.decode(res.body);
      if(jsonResponse != null){
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => LoginScreen()),
                (Route<dynamic> route) => false);
      }
    }
    else{
      print("Respone body: ${res.body}");
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
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
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
              text: "SIGNUP",
              // ignore: unrelated_type_equality_checks
              press: _emailController =="" || _passwordController ==""
                  ?null
                  :(){
                    signUp(_emailController.text, _passwordController.text);
                  },
            ),

            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
