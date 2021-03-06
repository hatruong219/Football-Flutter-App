import 'package:flutter/material.dart';
Widget TeamStatus(String team, String logoUrl, String teamName) {
  return Expanded(child: Column(
    children: [
      Text(
        team,
        style: const TextStyle(
          fontSize: 18.0,
        ),
      ),
      const SizedBox(
        height: 10.0,
      ),
      Container(
        child: Image.network(
          logoUrl,
          width: 54.0,
        ),
      ),
      const SizedBox(
        height: 10.0,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        child: Text(
          teamName,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),),
    ],
  ),);
}
