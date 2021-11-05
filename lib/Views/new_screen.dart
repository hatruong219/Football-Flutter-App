import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Views/News/news_all.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AllNews(),
    );
  }
}
