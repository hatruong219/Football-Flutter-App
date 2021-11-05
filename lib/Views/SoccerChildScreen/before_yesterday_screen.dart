import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BeforeYesterdayScreen extends StatefulWidget {
  const BeforeYesterdayScreen({Key? key}) : super(key: key);

  @override
  _BeforeYesterdayScreenState createState() => _BeforeYesterdayScreenState();
}

class _BeforeYesterdayScreenState extends State<BeforeYesterdayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(DateFormat.E().format(DateTime.now())),
    );
  }
}
