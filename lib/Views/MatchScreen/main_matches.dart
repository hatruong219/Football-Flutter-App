import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Views/DetailScreen/detail_main_screen.dart';
import 'package:flutter_app_demo/Views/splash_login_screen.dart';
import 'package:flutter_app_demo/api/api.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class OneLeague {
  final String idLeague;
  final String nameLeague;
  final String logoLeague;
  final List listMatch;

  OneLeague(this.idLeague, this.nameLeague, this.logoLeague, this.listMatch);

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

class MainMatches extends StatefulWidget {
  final String days;
  const MainMatches({Key? key, required this.days}) : super(key: key);

  @override
  _MainMatchesState createState() => _MainMatchesState();
}

class _MainMatchesState extends State<MainMatches> {

  Future<List<String>> getArrayOfUser() async {
    var response = await http.get(Uri.parse(
        '$linkApi/api/clubs/list/${finalEmail}'),
    );
    var jsonData = jsonDecode(response.body);
    print("List of User: "+ jsonData.toString());
    List<String> result =[];
    for(var id in jsonData){
      result.add(id.toString());
    }
    print("List of User: "+ result.toString());
    return result;
  }

  Future<List<OneMatches>> getAllMatches(listMatch) async {
    // print(listMatch);
    List<OneMatches> dataMatch = [];
    for(var oneMatch in listMatch){
      OneMatches temp = OneMatches(
          oneMatch["idMatch"],
          oneMatch["idHomeTeam"],
          oneMatch["idAwayTeam"],
          oneMatch["homeTeamName"],
          oneMatch["awayTeamName"],
          oneMatch["homeTeamImage"],
          oneMatch["awayTeamImage"],
          oneMatch["homeScore"],
          oneMatch["awayScore"],
          oneMatch["status"],
          oneMatch["time"]
      );
      dataMatch.add(temp);
    }
    return dataMatch;
  }


  Future<List<OneLeague>> getApiData() async {
    var response = await http.get(Uri.parse(
        '$linkApi/api/matches/${widget.days}'),
    );
    // print("$linkApi/api/matches/${widget.days}");
    var jsonData = jsonDecode(response.body);
    List<OneLeague> listLeague = [];
    for(var league in jsonData){
      OneLeague temp = OneLeague(
          league["id"],
          league["name"],
          league["logo"],
          league["listMatch"]
      );
      listLeague.add(temp);
    }
    return listLeague;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getApiData(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.data == null) {
            return const Center(
              child: Text(
                  'No Matches ...'
              ),
            );
          }
          else {
            return ListView.builder(
              itemCount: snap.data.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, index) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 5, bottom: 20, left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  snap.data[index].nameLeague.toString(),
                                  style: const TextStyle(
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.amber,
                                  size: 22,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      FutureBuilder(
                          future: getArrayOfUser(),
                          builder: (BuildContext context, AsyncSnapshot dataOfUser){
                            return FutureBuilder(
                              future: getAllMatches(snap.data[index].listMatch),
                              builder: (BuildContext context, AsyncSnapshot snapshot){
                                if(snapshot.data == null ){
                                  return const Center(
                                    child: Text(
                                        'No Matches ...'
                                    ),
                                  );
                                }
                                else{
                                  return ListView.builder(
                                    itemCount: snapshot.data.length,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext context, index){
                                      return GestureDetector(
                                          child: Container(
                                            margin: const EdgeInsets.only(bottom: 25, left: 10, right: 10),
                                            child: Container(
                                              padding: const EdgeInsets.only(right: 5, left: 5, top: 15, bottom: 15),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10.0),
                                                color: const Color.fromRGBO(160, 223, 255, 1),
                                              ),
                                              child: Row(
                                                children: [
                                                  // times
                                                  Expanded(
                                                      flex: 2,
                                                      child: Center(
                                                        child: Text(
                                                          snapshot.data[index].status.toString(),
                                                          style: const TextStyle(
                                                            color: Colors.indigo,
                                                            fontSize: 17,
                                                            fontWeight: FontWeight.w700,
                                                          ),

                                                        ),
                                                      )
                                                  ),
                                                  // team vs team
                                                  Expanded(
                                                    flex: 8,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  padding: const EdgeInsets.only(left: 5, right: 5),
                                                                  child: Image.network(
                                                                    snapshot.data[index].logoHomeTeam.toString(),
                                                                    height: 25,
                                                                    width: 25,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                snapshot.data[index].nameHomeTeam.toString().length > 20
                                                                    ? Text(snapshot.data[index].nameHomeTeam
                                                                    .toString()
                                                                    .substring(0, 17) +
                                                                    '...',
                                                                  style: const TextStyle(
                                                                    color: Colors.black,
                                                                    fontSize: 17,
                                                                    fontWeight: FontWeight.w600,

                                                                  ),
                                                                )
                                                                    : Text(
                                                                  snapshot.data[index].nameHomeTeam.toString(),
                                                                  style: const TextStyle(
                                                                    color: Colors.black,
                                                                    fontSize: 17,
                                                                    fontWeight: FontWeight.w600,

                                                                  ),
                                                                ),
                                                              ],
                                                            ),

                                                            Text(
                                                              snapshot.data[index].homeScore.toString(),
                                                              style: const TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 17,
                                                                fontWeight: FontWeight.w600,
                                                              ),
                                                            )

                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  padding: const EdgeInsets.only(left: 5, right: 5),
                                                                  child: Image.network(
                                                                    snapshot.data[index].logoAwayTeam.toString(),
                                                                    height: 25,
                                                                    width: 25,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 10,
                                                                )
                                                                ,
                                                                snapshot.data[index].nameAwayTeam.toString().length > 20
                                                                    ? Text(snapshot.data[index].nameAwayTeam
                                                                    .toString()
                                                                    .substring(0, 17) +
                                                                    '...',
                                                                  style: const TextStyle(
                                                                    color: Colors.black,
                                                                    fontSize: 17,
                                                                    fontWeight: FontWeight.w600,

                                                                  ),
                                                                )
                                                                    : Text(
                                                                  snapshot.data[index].nameAwayTeam.toString(),
                                                                  style: const TextStyle(
                                                                    color: Colors.black,
                                                                    fontSize: 17,
                                                                    fontWeight: FontWeight.w600,

                                                                  ),
                                                                ),

                                                              ],
                                                            ),

                                                            Text(
                                                              snapshot.data[index].awayScore.toString(),
                                                              style: const TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 17,
                                                                fontWeight: FontWeight.w600,
                                                              ),
                                                            )

                                                          ],
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                  // space
                                                  const Expanded(
                                                    flex: 1,
                                                    child: SizedBox(
                                                    ),
                                                  ),
                                                  // Icon favourites
                                                  Expanded(
                                                    flex: 1,
                                                    child: ( () {
                                                      if(dataOfUser.data==null){
                                                        return Icon(
                                                          Icons.notifications_none_rounded,
                                                          size: 26,
                                                          color: Colors.black,
                                                        );
                                                      }else{
                                                        if(dataOfUser.data.contains(snapshot.data[index].idHomeTeam) || dataOfUser.data.contains(snapshot.data[index].idAwayTeam)){
                                                          return Icon(
                                                            Icons.notifications,
                                                            size: 26,
                                                            color: Colors.redAccent,
                                                          );
                                                        }else{
                                                          return Icon(
                                                            Icons.notifications_none_rounded,
                                                            size: 26,
                                                            color: Colors.black,
                                                          );
                                                        }
                                                      }

                                                    }())
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          onTap: (){
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context)=>
                                                        DetailMainScreen(idMatch: snapshot.data[index].idMatch.toString())
                                                )
                                            );
                                          }
                                      );

                                    },
                                  );
                                }


                              },
                            );
                          })

                    ],
                );
              },
            );
          }
        }
    );
  }
}
