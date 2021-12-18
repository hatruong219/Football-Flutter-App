// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Views/DetailScreen/goal_status.dart';
import 'package:flutter_app_demo/Views/DetailScreen/team_status.dart';
import 'package:flutter_app_demo/api/api.dart';
import 'package:http/http.dart' as http;
import "package:date_format/date_format.dart";
import 'dart:async';
import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
class OneMatch {
  final String idMatch;
  final String status;
  final String date;
  final String svd;
  final Object homeTeam;
  final Object awayTeam;
  OneMatch(this.idMatch, this.status, this.date, this.svd, this.homeTeam,
      this.awayTeam);
}
class OneTeam{
  final String id;
  final String name;
  final String score;
  final String logo;
  final String Shon;
  final String Shof;
  final String Ofs;
  final String Att;
  final String Gks;
  final String Trt;
  final String Ths;
  final String Ycs;
  final String Crs;
  final String Pss;
  final String Shbl;
  final String Cos;
  final String Fls;

  OneTeam(this.id, this.name, this.score, this.logo, this.Shon, this.Shof,
      this.Ofs, this.Att, this.Gks, this.Trt, this.Ths, this.Ycs, this.Crs,
      this.Pss, this.Shbl, this.Cos, this.Fls);

}

class DetailMainScreen extends StatefulWidget {
  final String idMatch;
  const DetailMainScreen({Key? key, required this.idMatch}) : super(key: key);

  @override
  _DetailMainScreenState createState() => _DetailMainScreenState();
}

class _DetailMainScreenState extends State<DetailMainScreen> with TickerProviderStateMixin {
  Future<OneMatch> getApiData() async {
    var response = await http.get(Uri.parse(
        '$linkApi/api/matches/detail/${widget.idMatch}'
    ));

    print("sssssssssssssssss");
    var jsonData = jsonDecode(response.body);
    print(jsonData);
    OneTeam homeTeam = OneTeam(
      jsonData["listTeam"][0]["id"].toString(),
      jsonData["listTeam"][0]["name"].toString(),
      jsonData["listTeam"][0]["score"].toString(),
      jsonData["listTeam"][0]["logo"].toString(),
      jsonData["listTeam"][0]["Shon"].toString(),
      jsonData["listTeam"][0]["Shof"].toString(),
      jsonData["listTeam"][0]["Ofs"].toString(),
      jsonData["listTeam"][0]["Att"].toString(),
      jsonData["listTeam"][0]["Gks"].toString(),
      jsonData["listTeam"][0]["Trt"].toString(),
      jsonData["listTeam"][0]["Ths"].toString(),
      jsonData["listTeam"][0]["Ycs"].toString(),
      jsonData["listTeam"][0]["Crs"].toString(),
      jsonData["listTeam"][0]["Pss"].toString(),
      jsonData["listTeam"][0]["Shbl"].toString(),
      jsonData["listTeam"][0]["Cos"].toString(),
      jsonData["listTeam"][0]["Fls"].toString(),
    );
    OneTeam awayTeam = OneTeam(
      jsonData["listTeam"][1]["id"].toString(),
      jsonData["listTeam"][1]["name"].toString(),
      jsonData["listTeam"][1]["score"].toString(),
      jsonData["listTeam"][1]["logo"].toString(),
      jsonData["listTeam"][1]["Shon"].toString(),
      jsonData["listTeam"][1]["Shof"].toString(),
      jsonData["listTeam"][1]["Ofs"].toString(),
      jsonData["listTeam"][1]["Att"].toString(),
      jsonData["listTeam"][1]["Gks"].toString(),
      jsonData["listTeam"][1]["Trt"].toString(),
      jsonData["listTeam"][1]["Ths"].toString(),
      jsonData["listTeam"][1]["Ycs"].toString(),
      jsonData["listTeam"][1]["Crs"].toString(),
      jsonData["listTeam"][1]["Pss"].toString(),
      jsonData["listTeam"][1]["Shbl"].toString(),
      jsonData["listTeam"][1]["Cos"].toString(),
      jsonData["listTeam"][1]["Fls"].toString(),

    );
    OneMatch oneMatch = OneMatch(jsonData["idMatch"].toString(), jsonData["status"].toString(),
        jsonData["date"].toString(), jsonData["svd"].toString(), homeTeam, awayTeam);

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
                String dateTemp = snapshot.data.date.toString();
                String dateWithT = dateTemp.substring(0, 8) + 'T' + dateTemp.substring(8);
                print(dateWithT);
                DateTime dateMatch = DateTime.parse(dateWithT);
                return ListView(
                  children: [
                    const SizedBox(height: 12.0,),
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
                                    style: TextStyle(
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
                        SizedBox(height: 20,),
                        Container(
                          child: TabBar(
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
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 400,
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              Text("data 11"),
                              Text("data 22"),
                              Text("data 33"),
                              Text("data 44"),
                              Text("data 55"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text("data")
                  ],
                );
              }
            },
          ),
        )
    );
  }
}

