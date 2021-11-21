import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Views/MatchScreen/main_matches.dart';
import 'package:intl/intl.dart';

class BeforeYesterdayScreen extends StatelessWidget {
  final String days;
  const BeforeYesterdayScreen({Key? key, required this.days}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainMatches(days: days),
    );
  }
}