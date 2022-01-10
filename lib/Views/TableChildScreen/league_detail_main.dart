import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Views/TableChildScreen/matches_tab.dart';
import 'package:flutter_app_demo/Views/TableChildScreen/tables_tabs.dart';
import 'package:flutter_app_demo/api/api.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
class ClubOfTable {
  final String id, name, img;
  final int position, played, gd, points;

  ClubOfTable(this.id, this.name, this.img, this.position, this.played, this.gd,
      this.points);
}

class OneMatches {
  final String idMatch;
  final String idHomeTeam, idAwayTeam;
  final String nameHomeTeam, nameAwayTeam;

  final String logoHomeTeam, logoAwayTeam;
  final String homeScore, awayScore;
  final String status;
  final String time;
  OneMatches(
      this.idMatch,
      this.idHomeTeam,
      this.idAwayTeam,
      this.nameHomeTeam,
      this.nameAwayTeam,
      this.logoHomeTeam,
      this.logoAwayTeam,
      this.homeScore,
      this.awayScore,
      this.status,
      this.time
      );
}

class LeagueDetailMainScreen extends StatefulWidget {
  final String country;
  final String league;
  final String title;
  const LeagueDetailMainScreen({Key? key, required this.country, required this.league, required this.title}) : super(key: key);

  @override
  _LeagueDetailMainScreenState createState() => _LeagueDetailMainScreenState();
}

class _LeagueDetailMainScreenState extends State<LeagueDetailMainScreen> with SingleTickerProviderStateMixin {
  Future<List<ClubOfTable>> getApiTablesData() async {
    //api/league/italy/serie-a
    var response = await http.get(Uri.parse(
        '$linkApi/api/league/${widget.country}/${widget.league}'),
    );
    var jsonData = jsonDecode(response.body);
    List<ClubOfTable> listClubs = [];
    for(var club in jsonData) {
      ClubOfTable temp = ClubOfTable(
        club["id"],
        club["name"],
        club["img"],
        club["position"],
        club["played"],
        club["gd"],
        club["points"],
      );
      listClubs.add(temp);
    }
    return listClubs;

  }

  Future<List<OneMatches>> getApiResultsMatch() async{
    var response = await http.get(Uri.parse(
        '$linkApi/api/league/match-results/${widget.country}/${widget.league}'),
    );
    var jsonData = jsonDecode(response.body);
    List<OneMatches> listMatches = [];
    for(var oneMatch in jsonData){
      OneMatches temp = OneMatches(
          oneMatch["idMatch"].toString(),
          oneMatch["idHomeTeam"].toString(),
          oneMatch["idAwayTeam"].toString(),
          oneMatch["homeTeamName"].toString(),
          oneMatch["awayTeamName"].toString(),
          oneMatch["homeTeamImage"].toString(),
          oneMatch["awayTeamImage"].toString(),
          oneMatch["homeScore"].toString(),
          oneMatch["awayScore"].toString(),
          oneMatch["status"].toString(),
          oneMatch["time"].toString()
      );
      listMatches.add(temp);
    }
    return listMatches;
  }

  Future<List<OneMatches>> getApiFixturesMatch() async{
    var response = await http.get(Uri.parse(
        '$linkApi/api/league/match-fixtures/${widget.country}/${widget.league}'),
    );
    var jsonData = jsonDecode(response.body);
    List<OneMatches> listMatches = [];
    for(var oneMatch in jsonData){
      OneMatches temp = OneMatches(
          oneMatch["idMatch"].toString(),
          oneMatch["idHomeTeam"].toString(),
          oneMatch["idAwayTeam"].toString(),
          oneMatch["homeTeamName"].toString(),
          oneMatch["awayTeamName"].toString(),
          oneMatch["homeTeamImage"].toString(),
          oneMatch["awayTeamImage"].toString(),
          oneMatch["homeScore"].toString(),
          oneMatch["awayScore"].toString(),
          oneMatch["status"].toString(),
          oneMatch["time"].toString()
      );
      listMatches.add(temp);
    }
    return listMatches;
  }





  late TabController controller;


  @override
  void initState() {
    super.initState();

    controller = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            // padding: EdgeInsets.only(left: 5),
            icon: const Icon(Icons.settings),
            tooltip: '"""',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Next page'),
                    ),
                    body: const Center(
                      child: Text(
                        'This is the next page',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                },
              ));
            },
          ),
          title: Text(
              widget.title
          ),
          centerTitle: true,
          bottom: TabBar(

            controller: controller,
            indicatorColor: Colors.red,
            tabs:const <Widget>[
              Tab(
                text: "Results Match",
              ),
              Tab(
                text: "Tables",
              ),
              Tab(
                text: "Fixtures Match",
              ),
            ],
          )
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          FutureBuilder(
              future: getApiResultsMatch(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(snapshot.data != null) {
                  return MatchesTabScreen(dataMatches: snapshot.data, title: "Results Matches Of League");
                }else{
                  return const Center(
                    child: Text("No summary"),
                  );
                }
              }),

          FutureBuilder(
              future: getApiTablesData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(snapshot.data != null) {
                  return TablesTabScreen(dataTables: snapshot.data, title: widget.title);
                }else{
                  return const Center(
                    child: Text("No summary"),
                  );
                }
              }),
          FutureBuilder(
              future: getApiFixturesMatch(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(snapshot.data != null) {
                  return MatchesTabScreen(dataMatches: snapshot.data, title: "Fixtures Matches Of League");
                }else{
                  return const Center(
                    child: Text("No summary"),
                  );
                }
              }),
        ],
      ),

    );
  }
}
