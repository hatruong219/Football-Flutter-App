// ignore_for_file: avoid_print

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Views/DetailScreen/goal_status.dart';
import 'package:flutter_app_demo/Views/DetailScreen/info_tab_screen.dart';
import 'package:flutter_app_demo/Views/DetailScreen/status_tab_screen.dart';
import 'package:flutter_app_demo/Views/DetailScreen/summary_tab_screen.dart';
import 'package:flutter_app_demo/Views/DetailScreen/team_status.dart';
import 'package:flutter_app_demo/api/api.dart';
import 'package:http/http.dart' as http;
import "package:date_format/date_format.dart";
import 'dart:async';
import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'package:percent_indicator/percent_indicator.dart';



class OneTeam{
  final String id;
  final String name;
  final String score;
  final String logo;

  OneTeam(this.id, this.name, this.score, this.logo);

}
class OneMatch {
  final String idMatch;
  final String status;
  final String date;
  final String svd;
  final String referee;
  final Object homeTeam;
  final Object awayTeam;
  final List statusDetailInfo;
  final List statusHomeTeam;
  final List statusAwayTeam;
  OneMatch(this.idMatch, this.status, this.date, this.svd,this.referee, this.homeTeam,
      this.awayTeam, this.statusDetailInfo, this.statusHomeTeam, this.statusAwayTeam);
}

class OneSummary{
  final String min;
  final String minEx;
  final String numTeam;
  final String player;
  final String levelStatus;

  OneSummary(this.min, this.minEx, this.numTeam, this.player, this.levelStatus);
}

class DetailMainScreen extends StatefulWidget {
  final String idMatch;
  const DetailMainScreen({Key? key, required this.idMatch}) : super(key: key);

  @override
  _DetailMainScreenState createState() => _DetailMainScreenState();
}

class _DetailMainScreenState extends State<DetailMainScreen> with TickerProviderStateMixin {
  // ignore: non_constant_identifier_names
  Future<List<OneSummary>> getApiSummary() async {
    var response = await http.get(Uri.parse(
        '$linkApi/api/matches/detail/${widget.idMatch}'
    ));
    var jonDataTemp = jsonDecode(response.body);
    var jsonData = jonDataTemp["resultSummary"];
    print("llslslslsls"+jsonData.toString());
    List<OneSummary> listSummary = [];
    for(var one in jsonData){
      OneSummary temp = OneSummary(
        one["min"].toString(),
        one["minEx"].toString(),
        one["numTeam"].toString(),
        one["player"].toString(),
        one["levelStatus"].toString()
      );
      listSummary.add(temp);
    }
    return listSummary;
  }

  Future<OneMatch> getApiData() async {
    var response = await http.get(Uri.parse(
        '$linkApi/api/matches/detail/${widget.idMatch}'
    ));
    var jonDataTemp = jsonDecode(response.body);
    var jsonData = jonDataTemp["matches"];
    print(jonDataTemp);
    OneTeam homeTeam = OneTeam(
      jsonData["listTeam"][0]["id"].toString(),
      jsonData["listTeam"][0]["name"].toString(),
      jsonData["listTeam"][0]["score"].toString(),
      jsonData["listTeam"][0]["logo"].toString(),

    );
    OneTeam awayTeam = OneTeam(
      jsonData["listTeam"][1]["id"].toString(),
      jsonData["listTeam"][1]["name"].toString(),
      jsonData["listTeam"][1]["score"].toString(),
      jsonData["listTeam"][1]["logo"].toString(),
    );
    List<String> statusDetailInfo = [
        "Possession",//Pss,
        "Shots on targets", //shon
        "Shots off targets", //shof
        "Offsides",//Ofs
        "Counter attacks",//Att
        "Goalkeeper saves",//Gks,
        "Goal kicks",//Goa
        "Fouls",//Fls
        "Treatments",//Trt,
        "Throw ins",//Ths,
        "Yellow cards",//Ycs,
        "Crosses",//Crs
        "Blocked shots",//Shbl,
        "Corner kicks",//Cos,
        ];
    List<String> statusHomeTeam = [
      jsonData["listTeam"][0]["Pss"].toString(),
      jsonData["listTeam"][0]["Shon"].toString(),
      jsonData["listTeam"][0]["Shof"].toString(),
      jsonData["listTeam"][0]["Ofs"].toString(),
      jsonData["listTeam"][0]["Att"].toString(),
      jsonData["listTeam"][0]["Gks"].toString(),
      jsonData["listTeam"][0]["Goa"].toString(),
      jsonData["listTeam"][0]["Fls"].toString(),
      jsonData["listTeam"][0]["Trt"].toString(),
      jsonData["listTeam"][0]["Ths"].toString(),
      jsonData["listTeam"][0]["Ycs"].toString(),
      jsonData["listTeam"][0]["Crs"].toString(),
      jsonData["listTeam"][0]["Shbl"].toString(),
      jsonData["listTeam"][0]["Cos"].toString(),

    ];
    List<String> statusAwayTeam = [
        jsonData["listTeam"][1]["Pss"].toString(),
        jsonData["listTeam"][1]["Shon"].toString(),
        jsonData["listTeam"][1]["Shof"].toString(),
        jsonData["listTeam"][1]["Ofs"].toString(),
        jsonData["listTeam"][1]["Att"].toString(),
        jsonData["listTeam"][1]["Gks"].toString(),
        jsonData["listTeam"][1]["Goa"].toString(),
        jsonData["listTeam"][1]["Fls"].toString(),
        jsonData["listTeam"][1]["Trt"].toString(),
        jsonData["listTeam"][1]["Ths"].toString(),
        jsonData["listTeam"][1]["Ycs"].toString(),
        jsonData["listTeam"][1]["Crs"].toString(),
        jsonData["listTeam"][1]["Shbl"].toString(),
        jsonData["listTeam"][1]["Cos"].toString(),
    ];

    OneMatch oneMatch = OneMatch(jsonData["idMatch"].toString(), jsonData["status"].toString(),
        jsonData["date"].toString(), jsonData["svd"].toString(),jsonData["referee"],
        homeTeam, awayTeam,
        statusDetailInfo,statusHomeTeam, statusAwayTeam);

    return oneMatch;
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 5, vsync: this);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            tooltip: "Back",
            onPressed: (){},
          ),
          title: const Text("Detail Match"),
          centerTitle: true,
        ),
        body: Container(
          color: const Color.fromRGBO(160, 223, 255, 1),
          child: FutureBuilder(
            future: getApiData(),
            builder: (BuildContext context, AsyncSnapshot snapshot){

              if (snapshot.data == null) {
                return const Center(
                  child: Text(
                      'No Matches ...'
                  ),
                );
              }
              else{
                List statusMatch = [snapshot.data.statusDetailInfo,snapshot.data.statusHomeTeam, snapshot.data.statusAwayTeam];
                String dateTemp = snapshot.data.date.toString();
                String dateWithT = dateTemp.substring(0, 8) + 'T' + dateTemp.substring(8);
                print(dateWithT);
                DateTime dateMatch = DateTime.parse(dateWithT);
                OneMatch oneMatch = snapshot.data;
                return ListView(
                  children: [
                    Column(
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.blue,
                                  margin: const EdgeInsets.only(top: 20),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                                    child: Text(
                                      "Premier League",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    DateFormat.Hm().format(dateMatch)+" - "+
                                    DateFormat.yMd().format(dateMatch),
                                    style: const TextStyle(
                                        fontSize: 16
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TeamStatus("Home Team", snapshot.data.homeTeam.logo, snapshot.data.homeTeam.name),
                            GoalStatus(snapshot.data.status, snapshot.data.homeTeam.score, snapshot.data.awayTeam.score),
                            TeamStatus("Away Team", snapshot.data.awayTeam.logo, snapshot.data.awayTeam.name),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        TabBar(
                          controller: _tabController,
                          isScrollable: true,
                          labelColor: Colors.indigo,
                          tabs:const [
                            Tab(
                              child: Text(
                                "Info",
                                style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Summary",
                                style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Status",
                                style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Line-ups",
                                style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Hight Light",
                                style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          height: 370,
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              InfoMatchTab(oneMatch: oneMatch,),
                              FutureBuilder(
                                future: getApiSummary(),
                                builder: (BuildContext context, AsyncSnapshot snapshot) {
                                  if(snapshot.data != null) {
                                    return SummaryMatchTab(summaryMatch: snapshot.data);
                                  }else{
                                    return const Center(
                                      child: Text("No summary"),
                                    );
                                  }
                                }),
                              StatusMatchTab(statusMatch: statusMatch,),
                              Text("data 44"),
                              Text("data 55"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
            },
          ),
        )
    );
  }
}

