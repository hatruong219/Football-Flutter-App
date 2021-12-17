import 'package:flutter/material.dart';

Widget GoalStatus(int expandedTime, int homeGoal, int awayGoal){
  var home = homeGoal;
  var away = awayGoal;
  var expanded = expandedTime;
  home ??= 0;
  away ??=0;
  expanded ??= 0;
  return Expanded(child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
          child: Center(
            child: Text(
              "${home} : ${away}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 36.0
              ),
            ),
          )
      ),
      Text(
        "${expanded} '",
        style: const TextStyle(
            fontSize: 28.0
        ),
      )
    ],
  ),);
}