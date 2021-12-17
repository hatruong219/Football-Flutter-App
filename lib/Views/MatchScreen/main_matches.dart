import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Views/DetailScreen/detail_main_screen.dart';
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
  final String idHomeTeam, idAwayTeam;
  final String nameHomeTeam, nameAwayTeam;
  final String homeScore, awayScore;
  final String status;
  final String time;
  OneMatches(
      this.idHomeTeam,
      this.idAwayTeam,
      this.nameHomeTeam,
      this.nameAwayTeam,
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

  Future<List<OneMatches>> getAllMatches(listMatch) async {
    print(listMatch);
    List<OneMatches> dataMatch = [];
    for(var oneMatch in listMatch){
      OneMatches temp = OneMatches(
          oneMatch["homeTeamName"],
          oneMatch["homeTeamName"],
          oneMatch["homeTeamName"],
          oneMatch["awayTeamName"],
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
    print("$linkApi/api/matches/${widget.days}");
    var jsonData = jsonDecode(response.body);
    List<OneLeague> listLeague = [];
    // ignore: non_constant_identifier_names
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
                  'Loading ...'
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
                            padding: new EdgeInsets.only(top: 20, bottom: 10),
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
                                      margin: const EdgeInsets.only(top: 25, left: 10, right: 10),
                                      child: Container(
                                        padding: const EdgeInsets.only(right: 5, left: 5, top: 15, bottom: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          color: Color.fromRGBO(160, 223, 255, 1),
                                        ),
                                        child: Row(
                                          children: [
                                            // times
                                            Expanded(
                                                flex: 2,
                                                child: Center(
                                                  child: Text(
                                                    snapshot.data[index].time.toString()+"p",
                                                    style: const TextStyle(
                                                      color: Colors.amber,
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
                                                            child: Image.asset(
                                                              "assets/images/seria.png",
                                                              height: 20,
                                                              width: 20,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          )
                                                          ,
                                                          Text(
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
                                                            child: Image.asset(
                                                              "assets/images/laliga.png",
                                                              height: 20,
                                                              width: 20,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          )
                                                          ,
                                                          Text(
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
                                                Icons.notifications_none_rounded,
                                                size: 26,
                                                color: Colors.black,
                                              ),
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
                                                DetailMainScreen()
                                          )
                                      );
                                  }
                                );
                                return Container(
                                  margin: const EdgeInsets.only(top: 25, left: 10, right: 10),
                                  child: Container(
                                      padding: const EdgeInsets.only(right: 5, left: 5, top: 15, bottom: 15),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: Colors.lightBlue[50],
                                      ),
                                      child: Row(
                                        children: [
                                          // times
                                          Expanded(
                                              flex: 2,
                                              child: Center(
                                                child: Text(
                                                  snapshot.data[index].time.toString()+"p",
                                                  style: const TextStyle(
                                                    color: Colors.amber,
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
                                                          child: Image.asset(
                                                            "assets/images/seria.png",
                                                            height: 20,
                                                            width: 20,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        )
                                                        ,
                                                        Text(
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
                                                          child: Image.asset(
                                                            "assets/images/laliga.png",
                                                            height: 20,
                                                            width: 20,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        )
                                                        ,
                                                        Text(
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
                                              Icons.notifications_none_rounded,
                                              size: 26,
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                );
                              },
                            );
                          }
                            // return Padding(
                            //   padding: const EdgeInsets.only(top: 25),
                            //   child: Row(
                            //     children: [
                            //       // times
                            //       Expanded(
                            //         flex: 2,
                            //         child: Text(
                            //           snapshot.data[index].time.toString(),
                            //           style: const TextStyle(
                            //             color: Colors.amber,
                            //             fontSize: 17,
                            //             fontWeight: FontWeight.w700,
                            //           ),
                            //
                            //         ),
                            //       ),
                            //       // team vs team
                            //       Expanded(
                            //         flex: 8,
                            //         child: Column(
                            //           mainAxisAlignment: MainAxisAlignment.start,
                            //           crossAxisAlignment: CrossAxisAlignment.start,
                            //           children: [
                            //             Row(
                            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //               children: [
                            //                 Row(
                            //                   children: [
                            //                     Container(
                            //                       padding: const EdgeInsets.only(left: 5, right: 5),
                            //                       child: Image.asset(
                            //                         "assets/images/seria.png",
                            //                         height: 20,
                            //                         width: 20,
                            //                       ),
                            //                     ),
                            //                     const SizedBox(
                            //                       width: 10,
                            //                     )
                            //                     ,
                            //                     Text(
                            //                       snapshot.data[index].nameHomeTeam.toString(),
                            //                       style: const TextStyle(
                            //                         color: Colors.black,
                            //                         fontSize: 17,
                            //                         fontWeight: FontWeight.w600,
                            //                       ),
                            //                     ),
                            //
                            //                   ],
                            //                 ),
                            //
                            //                 Text(
                            //                   snapshot.data[index].homeScore.toString(),
                            //                   style: const TextStyle(
                            //                     color: Colors.black,
                            //                     fontSize: 17,
                            //                     fontWeight: FontWeight.w600,
                            //                   ),
                            //                 )
                            //
                            //               ],
                            //             ),
                            //             const SizedBox(
                            //               height: 10,
                            //             ),
                            //             Row(
                            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //               children: [
                            //                 Row(
                            //                   children: [
                            //                     Container(
                            //                       padding: const EdgeInsets.only(left: 5, right: 5),
                            //                       child: Image.asset(
                            //                         "assets/images/laliga.png",
                            //                         height: 20,
                            //                         width: 20,
                            //                       ),
                            //                     ),
                            //                     const SizedBox(
                            //                       width: 10,
                            //                     )
                            //                     ,
                            //                     Text(
                            //                       snapshot.data[index].nameAwayTeam.toString(),
                            //                       style: const TextStyle(
                            //                         color: Colors.black,
                            //                         fontSize: 17,
                            //                         fontWeight: FontWeight.w600,
                            //                       ),
                            //                     ),
                            //
                            //                   ],
                            //                 ),
                            //
                            //                 Text(
                            //                   snapshot.data[index].awayScore.toString(),
                            //                   style: const TextStyle(
                            //                     color: Colors.black,
                            //                     fontSize: 17,
                            //                     fontWeight: FontWeight.w600,
                            //                   ),
                            //                 )
                            //
                            //               ],
                            //             ),
                            //
                            //           ],
                            //         ),
                            //       ),
                            //       // space
                            //       const Expanded(
                            //         flex: 1,
                            //         child: SizedBox(
                            //         ),
                            //       ),
                            //       // Icon favourites
                            //       const Expanded(
                            //         flex: 1,
                            //         child: Icon(
                            //           Icons.notifications_none_rounded,
                            //           size: 26,
                            //           color: Colors.black,
                            //         ),
                            //       )
                            //     ],
                            //   ),
                            // );

                        },
                      )
                    ],
                );
              },
            );
          }
        }
    );
  }
}




// bản cũ
// class MainMatches extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: 2,
//         itemBuilder: (BuildContext context, int index){
//           return Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Premire league title
//                 Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Premier League",
//                           style: TextStyle(
//                             color: Colors.amber,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 23,
//                           ),
//                         ),
//                         Icon(
//                           Icons.arrow_forward_ios,
//                           color: Colors.amber,
//                           size: 22,
//                         )
//                       ],
//                     ),
//                     // team vs team
//                     Padding(
//                       padding: const EdgeInsets.only(top: 25),
//                       child: Row(
//                         children: [
//                           // times
//                           Expanded(
//                             flex: 2,
//                             child: Text(
//                               "2",
//                               style: TextStyle(
//                                 color: Colors.amber,
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.w700,
//                               ),
//
//                             ),
//                           ),
//                           // team vs team
//                           Expanded(
//                             flex: 8,
//                             child: Container(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Container(
//                                           child: Row(
//                                             children: [
//                                               Container(
//                                                 padding: EdgeInsets.only(left: 5, right: 5),
//                                                 child: Image.asset(
//                                                   "assets/images/seria.png",
//                                                   height: 20,
//                                                   width: 20,
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 10,
//                                               )
//                                               ,
//                                               Text(
//                                                 "Real Marid",
//                                                 style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 17,
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),
//
//                                             ],
//                                           ),
//                                         ),
//
//                                         Container(
//                                           child: Text(
//                                             "1",
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 17,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           ),
//                                         )
//
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Container(
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Container(
//                                           child: Row(
//                                             children: [
//                                               Container(
//                                                 padding: EdgeInsets.only(left: 5, right: 5),
//                                                 child: Image.asset(
//                                                   "assets/images/seria.png",
//                                                   height: 20,
//                                                   width: 20,
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 10,
//                                               )
//                                               ,
//                                               Text(
//                                                 "Real Marid",
//                                                 style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 17,
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),
//
//                                             ],
//                                           ),
//                                         ),
//
//                                         Container(
//                                           child: Text(
//                                             "1",
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 17,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           ),
//                                         )
//
//                                       ],
//                                     ),
//                                   ),
//
//                                 ],
//                               ),
//                             ),
//                           ),
//                           // space
//                           Expanded(
//                             flex: 1,
//                             child: SizedBox(
//                             ),
//                           ),
//                           // Icon favourites
//                           Expanded(
//                             flex: 1,
//                             child: Icon(
//                               Icons.notifications_none_rounded,
//                               size: 26,
//                               color: Colors.black,
//                             ),
//                           )
//
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 25),
//                       child: Row(
//                         children: [
//                           // times
//                           Expanded(
//                             flex: 2,
//                             child: Text(
//                               "16:00",
//                               style: TextStyle(
//                                 color: Colors.amber,
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.w700,
//                               ),
//
//                             ),
//                           ),
//                           // team vs team
//                           Expanded(
//                             flex: 8,
//                             child: Container(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Container(
//                                           child: Row(
//                                             children: [
//                                               Container(
//                                                 padding: EdgeInsets.only(left: 5, right: 5),
//                                                 child: Image.asset(
//                                                   "assets/images/seria.png",
//                                                   height: 20,
//                                                   width: 20,
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 10,
//                                               )
//                                               ,
//                                               Text(
//                                                 "Real Marid",
//                                                 style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 17,
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),
//
//                                             ],
//                                           ),
//                                         ),
//
//                                         Container(
//                                           child: Text(
//                                             "1",
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 17,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           ),
//                                         )
//
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Container(
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Container(
//                                           child: Row(
//                                             children: [
//                                               Container(
//                                                 padding: EdgeInsets.only(left: 5, right: 5),
//                                                 child: Image.asset(
//                                                   "assets/images/seria.png",
//                                                   height: 20,
//                                                   width: 20,
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 10,
//                                               )
//                                               ,
//                                               Text(
//                                                 "Real Marid",
//                                                 style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 17,
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),
//
//                                             ],
//                                           ),
//                                         ),
//
//                                         Container(
//                                           child: Text(
//                                             "1",
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 17,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           ),
//                                         )
//
//                                       ],
//                                     ),
//                                   ),
//
//                                 ],
//                               ),
//                             ),
//                           ),
//                           // space
//                           Expanded(
//                             flex: 1,
//                             child: SizedBox(
//                             ),
//                           ),
//                           // Icon favourites
//                           Expanded(
//                             flex: 1,
//                             child: Icon(
//                               Icons.notifications_none_rounded,
//                               size: 26,
//                               color: Colors.black,
//                             ),
//                           )
//
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 25),
//                       child: Row(
//                         children: [
//                           // times
//                           Expanded(
//                             flex: 2,
//                             child: Text(
//                               "2",
//                               style: TextStyle(
//                                 color: Colors.amber,
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.w700,
//                               ),
//
//                             ),
//                           ),
//                           // team vs team
//                           Expanded(
//                             flex: 8,
//                             child: Container(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Container(
//                                           child: Row(
//                                             children: [
//                                               Container(
//                                                 padding: EdgeInsets.only(left: 5, right: 5),
//                                                 child: Image.asset(
//                                                   "assets/images/seria.png",
//                                                   height: 20,
//                                                   width: 20,
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 10,
//                                               )
//                                               ,
//                                               Text(
//                                                 "Real Marid",
//                                                 style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 17,
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),
//
//                                             ],
//                                           ),
//                                         ),
//
//                                         Container(
//                                           child: Text(
//                                             "1",
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 17,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           ),
//                                         )
//
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Container(
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Container(
//                                           child: Row(
//                                             children: [
//                                               Container(
//                                                 padding: EdgeInsets.only(left: 5, right: 5),
//                                                 child: Image.asset(
//                                                   "assets/images/seria.png",
//                                                   height: 20,
//                                                   width: 20,
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 10,
//                                               )
//                                               ,
//                                               Text(
//                                                 "Real Marid",
//                                                 style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 17,
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),
//
//                                             ],
//                                           ),
//                                         ),
//
//                                         Container(
//                                           child: Text(
//                                             "1",
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 17,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           ),
//                                         )
//
//                                       ],
//                                     ),
//                                   ),
//
//                                 ],
//                               ),
//                             ),
//                           ),
//                           // space
//                           Expanded(
//                             flex: 1,
//                             child: SizedBox(
//                             ),
//                           ),
//                           // Icon favourites
//                           Expanded(
//                             flex: 1,
//                             child: Icon(
//                               Icons.notifications_none_rounded,
//                               size: 26,
//                               color: Colors.black,
//                             ),
//                           )
//
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 25,
//                 ),
//                 Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Sẻia League",
//                           style: TextStyle(
//                             color: Colors.amber,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 23,
//                           ),
//                         ),
//                         Icon(
//                           Icons.arrow_forward_ios,
//                           color: Colors.amber,
//                           size: 22,
//                         )
//                       ],
//                     ),
//                     // team vs team
//                     Padding(
//                       padding: const EdgeInsets.only(top: 25),
//                       child: Row(
//                         children: [
//                           // times
//                           Expanded(
//                             flex: 2,
//                             child: Text(
//                               "2",
//                               style: TextStyle(
//                                 color: Colors.amber,
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.w700,
//                               ),
//
//                             ),
//                           ),
//                           // team vs team
//                           Expanded(
//                             flex: 8,
//                             child: Container(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Container(
//                                           child: Row(
//                                             children: [
//                                               Container(
//                                                 padding: EdgeInsets.only(left: 5, right: 5),
//                                                 child: Image.asset(
//                                                   "assets/images/seria.png",
//                                                   height: 20,
//                                                   width: 20,
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 10,
//                                               )
//                                               ,
//                                               Text(
//                                                 "Real Marid",
//                                                 style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 17,
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),
//
//                                             ],
//                                           ),
//                                         ),
//
//                                         Container(
//                                           child: Text(
//                                             "1",
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 17,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           ),
//                                         )
//
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Container(
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Container(
//                                           child: Row(
//                                             children: [
//                                               Container(
//                                                 padding: EdgeInsets.only(left: 5, right: 5),
//                                                 child: Image.asset(
//                                                   "assets/images/seria.png",
//                                                   height: 20,
//                                                   width: 20,
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 10,
//                                               )
//                                               ,
//                                               Text(
//                                                 "Real Marid",
//                                                 style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 17,
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),
//
//                                             ],
//                                           ),
//                                         ),
//
//                                         Container(
//                                           child: Text(
//                                             "1",
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 17,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           ),
//                                         )
//
//                                       ],
//                                     ),
//                                   ),
//
//                                 ],
//                               ),
//                             ),
//                           ),
//                           // space
//                           Expanded(
//                             flex: 1,
//                             child: SizedBox(
//                             ),
//                           ),
//                           // Icon favourites
//                           Expanded(
//                             flex: 1,
//                             child: Icon(
//                               Icons.notifications_none_rounded,
//                               size: 26,
//                               color: Colors.black,
//                             ),
//                           )
//
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 25),
//                       child: Row(
//                         children: [
//                           // times
//                           Expanded(
//                             flex: 2,
//                             child: Text(
//                               "16:00",
//                               style: TextStyle(
//                                 color: Colors.amber,
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.w700,
//                               ),
//
//                             ),
//                           ),
//                           // team vs team
//                           Expanded(
//                             flex: 8,
//                             child: Container(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Container(
//                                           child: Row(
//                                             children: [
//                                               Container(
//                                                 padding: EdgeInsets.only(left: 5, right: 5),
//                                                 child: Image.asset(
//                                                   "assets/images/seria.png",
//                                                   height: 20,
//                                                   width: 20,
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 10,
//                                               )
//                                               ,
//                                               Text(
//                                                 "Real Marid",
//                                                 style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 17,
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),
//
//                                             ],
//                                           ),
//                                         ),
//
//                                         Container(
//                                           child: Text(
//                                             "1",
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 17,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           ),
//                                         )
//
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Container(
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Container(
//                                           child: Row(
//                                             children: [
//                                               Container(
//                                                 padding: EdgeInsets.only(left: 5, right: 5),
//                                                 child: Image.asset(
//                                                   "assets/images/seria.png",
//                                                   height: 20,
//                                                   width: 20,
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 10,
//                                               )
//                                               ,
//                                               Text(
//                                                 "Real Marid",
//                                                 style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 17,
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),
//
//                                             ],
//                                           ),
//                                         ),
//
//                                         Container(
//                                           child: Text(
//                                             "1",
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 17,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           ),
//                                         )
//
//                                       ],
//                                     ),
//                                   ),
//
//                                 ],
//                               ),
//                             ),
//                           ),
//                           // space
//                           Expanded(
//                             flex: 1,
//                             child: SizedBox(
//                             ),
//                           ),
//                           // Icon favourites
//                           Expanded(
//                             flex: 1,
//                             child: Icon(
//                               Icons.notifications_none_rounded,
//                               size: 26,
//                               color: Colors.black,
//                             ),
//                           )
//
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 25),
//                       child: Row(
//                         children: [
//                           // times
//                           Expanded(
//                             flex: 2,
//                             child: Text(
//                               "2",
//                               style: TextStyle(
//                                 color: Colors.amber,
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.w700,
//                               ),
//
//                             ),
//                           ),
//                           // team vs team
//                           Expanded(
//                             flex: 8,
//                             child: Container(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Container(
//                                           child: Row(
//                                             children: [
//                                               Container(
//                                                 padding: EdgeInsets.only(left: 5, right: 5),
//                                                 child: Image.asset(
//                                                   "assets/images/seria.png",
//                                                   height: 20,
//                                                   width: 20,
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 10,
//                                               )
//                                               ,
//                                               Text(
//                                                 "Real Marid",
//                                                 style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 17,
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),
//
//                                             ],
//                                           ),
//                                         ),
//
//                                         Container(
//                                           child: Text(
//                                             "1",
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 17,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           ),
//                                         )
//
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Container(
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Container(
//                                           child: Row(
//                                             children: [
//                                               Container(
//                                                 padding: EdgeInsets.only(left: 5, right: 5),
//                                                 child: Image.asset(
//                                                   "assets/images/seria.png",
//                                                   height: 20,
//                                                   width: 20,
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 10,
//                                               )
//                                               ,
//                                               Text(
//                                                 "Real Marid",
//                                                 style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 17,
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),
//
//                                             ],
//                                           ),
//                                         ),
//
//                                         Container(
//                                           child: Text(
//                                             "1",
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 17,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           ),
//                                         )
//
//                                       ],
//                                     ),
//                                   ),
//
//                                 ],
//                               ),
//                             ),
//                           ),
//                           // space
//                           Expanded(
//                             flex: 1,
//                             child: SizedBox(
//                             ),
//                           ),
//                           // Icon favourites
//                           Expanded(
//                             flex: 1,
//                             child: Icon(
//                               Icons.notifications_none_rounded,
//                               size: 26,
//                               color: Colors.black,
//                             ),
//                           )
//
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 25,
//                 ),
//                 Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Premier League",
//                           style: TextStyle(
//                             color: Colors.amber,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 23,
//                           ),
//                         ),
//                         Icon(
//                           Icons.arrow_forward_ios,
//                           color: Colors.amber,
//                           size: 22,
//                         )
//                       ],
//                     ),
//                     // team vs team
//                     Padding(
//                       padding: const EdgeInsets.only(top: 25),
//                       child: Row(
//                         children: [
//                           // times
//                           Expanded(
//                             flex: 2,
//                             child: Text(
//                               "2",
//                               style: TextStyle(
//                                 color: Colors.amber,
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.w700,
//                               ),
//
//                             ),
//                           ),
//                           // team vs team
//                           Expanded(
//                             flex: 8,
//                             child: Container(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Container(
//                                           child: Row(
//                                             children: [
//                                               Container(
//                                                 padding: EdgeInsets.only(left: 5, right: 5),
//                                                 child: Image.asset(
//                                                   "assets/images/seria.png",
//                                                   height: 20,
//                                                   width: 20,
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 10,
//                                               )
//                                               ,
//                                               Text(
//                                                 "Real Marid",
//                                                 style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 17,
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),
//
//                                             ],
//                                           ),
//                                         ),
//
//                                         Container(
//                                           child: Text(
//                                             "1",
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 17,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           ),
//                                         )
//
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Container(
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Container(
//                                           child: Row(
//                                             children: [
//                                               Container(
//                                                 padding: EdgeInsets.only(left: 5, right: 5),
//                                                 child: Image.asset(
//                                                   "assets/images/seria.png",
//                                                   height: 20,
//                                                   width: 20,
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 10,
//                                               )
//                                               ,
//                                               Text(
//                                                 "Real Marid",
//                                                 style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 17,
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),
//
//                                             ],
//                                           ),
//                                         ),
//
//                                         Container(
//                                           child: Text(
//                                             "1",
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 17,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           ),
//                                         )
//
//                                       ],
//                                     ),
//                                   ),
//
//                                 ],
//                               ),
//                             ),
//                           ),
//                           // space
//                           Expanded(
//                             flex: 1,
//                             child: SizedBox(
//                             ),
//                           ),
//                           // Icon favourites
//                           Expanded(
//                             flex: 1,
//                             child: Icon(
//                               Icons.notifications_none_rounded,
//                               size: 26,
//                               color: Colors.black,
//                             ),
//                           )
//
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 25),
//                       child: Row(
//                         children: [
//                           // times
//                           Expanded(
//                             flex: 2,
//                             child: Text(
//                               "16:00",
//                               style: TextStyle(
//                                 color: Colors.amber,
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.w700,
//                               ),
//
//                             ),
//                           ),
//                           // team vs team
//                           Expanded(
//                             flex: 8,
//                             child: Container(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Container(
//                                           child: Row(
//                                             children: [
//                                               Container(
//                                                 padding: EdgeInsets.only(left: 5, right: 5),
//                                                 child: Image.asset(
//                                                   "assets/images/seria.png",
//                                                   height: 20,
//                                                   width: 20,
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 10,
//                                               )
//                                               ,
//                                               Text(
//                                                 "Real Marid",
//                                                 style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 17,
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),
//
//                                             ],
//                                           ),
//                                         ),
//
//                                         Container(
//                                           child: Text(
//                                             "1",
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 17,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           ),
//                                         )
//
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Container(
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Container(
//                                           child: Row(
//                                             children: [
//                                               Container(
//                                                 padding: EdgeInsets.only(left: 5, right: 5),
//                                                 child: Image.asset(
//                                                   "assets/images/seria.png",
//                                                   height: 20,
//                                                   width: 20,
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 10,
//                                               )
//                                               ,
//                                               Text(
//                                                 "Real Marid",
//                                                 style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 17,
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),
//
//                                             ],
//                                           ),
//                                         ),
//
//                                         Container(
//                                           child: Text(
//                                             "1",
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 17,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           ),
//                                         )
//
//                                       ],
//                                     ),
//                                   ),
//
//                                 ],
//                               ),
//                             ),
//                           ),
//                           // space
//                           Expanded(
//                             flex: 1,
//                             child: SizedBox(
//                             ),
//                           ),
//                           // Icon favourites
//                           Expanded(
//                             flex: 1,
//                             child: Icon(
//                               Icons.notifications_none_rounded,
//                               size: 26,
//                               color: Colors.black,
//                             ),
//                           )
//
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 25),
//                       child: Row(
//                         children: [
//                           // times
//                           Expanded(
//                             flex: 2,
//                             child: Text(
//                               "2",
//                               style: TextStyle(
//                                 color: Colors.amber,
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.w700,
//                               ),
//
//                             ),
//                           ),
//                           // team vs team
//                           Expanded(
//                             flex: 8,
//                             child: Container(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Container(
//                                           child: Row(
//                                             children: [
//                                               Container(
//                                                 padding: EdgeInsets.only(left: 5, right: 5),
//                                                 child: Image.asset(
//                                                   "assets/images/seria.png",
//                                                   height: 20,
//                                                   width: 20,
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 10,
//                                               )
//                                               ,
//                                               Text(
//                                                 "Real Marid",
//                                                 style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 17,
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),
//
//                                             ],
//                                           ),
//                                         ),
//
//                                         Container(
//                                           child: Text(
//                                             "1",
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 17,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           ),
//                                         )
//
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Container(
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Container(
//                                           child: Row(
//                                             children: [
//                                               Container(
//                                                 padding: EdgeInsets.only(left: 5, right: 5),
//                                                 child: Image.asset(
//                                                   "assets/images/seria.png",
//                                                   height: 20,
//                                                   width: 20,
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 10,
//                                               )
//                                               ,
//                                               Text(
//                                                 "Real Marid",
//                                                 style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 17,
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),
//
//                                             ],
//                                           ),
//                                         ),
//
//                                         Container(
//                                           child: Text(
//                                             "1",
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 17,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           ),
//                                         )
//
//                                       ],
//                                     ),
//                                   ),
//
//                                 ],
//                               ),
//                             ),
//                           ),
//                           // space
//                           Expanded(
//                             flex: 1,
//                             child: SizedBox(
//                             ),
//                           ),
//                           // Icon favourites
//                           Expanded(
//                             flex: 1,
//                             child: Icon(
//                               Icons.notifications_none_rounded,
//                               size: 26,
//                               color: Colors.black,
//                             ),
//                           )
//
//                         ],
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           );
//         }
//     );
//   }
// }


