import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Views/DetailScreen/detail_main_screen.dart';
import 'package:flutter_app_demo/Views/splash_login_screen.dart';
import 'package:flutter_app_demo/api/api.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:intl/intl.dart';

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

class MatchesFavouritesTab extends StatefulWidget {
  const MatchesFavouritesTab({Key? key}) : super(key: key);

  @override
  _MatchesFavouritesTabState createState() => _MatchesFavouritesTabState();
}

class _MatchesFavouritesTabState extends State<MatchesFavouritesTab> {
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

  Future<List<OneMatches>> getApiResultsMatch(String idClubs) async{
    var response = await http.get(Uri.parse(
        '$linkApi/api/clubs/list-match-favourites/$idClubs'),
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

  @override
  Widget build(BuildContext context) {
    if(finalEmail != null){
      return SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 10,),
              hasAccount()
            ]
          ));
    }else{
      return noAccount();
    }
  }

  Widget hasAccount(){
    return FutureBuilder(
        future: getArrayOfUser(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.data == null) {
            return noData();
          }else {
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
                            children: const [
                              Text(
                                "Fixtures Match",
                                style: TextStyle(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23
                                ),
                              ),
                              Icon(
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
                      future: getApiResultsMatch(snap.data[index]),
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
                                                  child: ( () {
                                                    String dateTemp = snapshot.data[index].time.toString();
                                                    String dateWithT = dateTemp.substring(0, 8) + 'T' + dateTemp.substring(8);
                                                    DateTime dateMatch = DateTime.parse(dateWithT);
                                                    if(snapshot.data[index].status.toString()=="NS"){
                                                      return Column(
                                                        children: [
                                                          Text(
                                                            DateFormat.MMMd().format(dateMatch),
                                                            style: const TextStyle(
                                                                fontSize: 13
                                                            ),
                                                          ),
                                                          SizedBox(height: 10,),
                                                          Text(
                                                            DateFormat.Hm().format(dateMatch),
                                                            style: const TextStyle(
                                                              color: Colors.indigo,
                                                              fontSize: 17,
                                                              fontWeight: FontWeight.w700,
                                                            ),
                                                          )
                                                        ],
                                                      );
                                                    }else{
                                                      return Text(
                                                        snapshot.data[index].status.toString(),
                                                        style: const TextStyle(
                                                          color: Colors.indigo,
                                                          fontSize: 17,
                                                          fontWeight: FontWeight.w700,
                                                        ),
                                                      );
                                                    }

                                                  }())



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
                                          const Expanded(
                                              flex: 1,
                                              child: Icon(
                                                Icons.notifications,
                                                size: 26,
                                                color: Colors.redAccent,
                                              )
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
                    )

                  ],
                );
              },
            );
          }});
  }

  Widget noData(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Tap ",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 17,

                ),
              ),
              Icon(Icons.notifications_none_rounded),
              Text(" to add a Match to Favourites",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 17,
                ),
              )
            ],
          ),
          SizedBox(height: 30,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color.fromRGBO(160, 223, 255, 1),
            ),
            child:Row(children: [
              // times
              const Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      "FT",
                      style: TextStyle(
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
                          children: const [
                            SizedBox(
                              width: 10,
                            ),
                            Text("Team A",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,

                              ),
                            )
                          ],
                        ),
                        const Text(
                          "0",
                          style: TextStyle(
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
                          children: const [
                            SizedBox(
                              width: 10,
                            )
                            ,
                            Text("Team B",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,

                              ),
                            )

                          ],
                        ),

                        const Text(
                          "0",
                          style: TextStyle(
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
              const Expanded(
                  flex: 1,
                  child: Icon(Icons.notifications,
                    color: Colors.red,)
              )
            ] ,
            ),
          )
        ],
      ),
    );
  }

  Widget noAccount(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Login to add Favourites Teams",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 17,
                ),)
            ],
          ),
          const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Tap ",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 17,

                ),
              ),
              Icon(Icons.notifications_none_rounded),
              Text(" to add a Match to Favourites",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 17,
                ),
              )
            ],
          ),
          const SizedBox(height: 20,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color.fromRGBO(160, 223, 255, 1),
            ),
            child:Row(children: [
              // times
              const Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      "FT",
                      style: TextStyle(
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
                          children: const [
                            SizedBox(
                              width: 10,
                            ),
                            Text("Team A",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,

                              ),
                            )
                          ],
                        ),
                        const Text(
                          "0",
                          style: TextStyle(
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
                          children: const [
                            SizedBox(
                              width: 10,
                            )
                            ,
                            Text("Team B",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,

                              ),
                            )

                          ],
                        ),

                        const Text(
                          "0",
                          style: TextStyle(
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
              const Expanded(
                  flex: 1,
                  child: Icon(Icons.notifications,
                    color: Colors.red,)
              )
            ] ,
            ),
          )
        ],
      ),
    );
  }
}

