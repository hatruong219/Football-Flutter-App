import 'package:flutter/material.dart';

class LanguageContainer extends StatelessWidget {
  final String imageLanguage;
  const LanguageContainer({Key? key, required this.imageLanguage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(imageLanguage);
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.asset(imageLanguage));
  }
}
