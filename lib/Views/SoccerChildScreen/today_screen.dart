import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Views/MatchScreen/main_matches.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({Key? key}) : super(key: key);

  @override
  _TodayScreenState createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  @override
  Widget build(BuildContext context) {
    return MainMatches();
  }
}
