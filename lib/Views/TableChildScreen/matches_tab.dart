import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Views/DetailScreen/detail_main_screen.dart';
import 'package:flutter_app_demo/Views/TableChildScreen/league_detail_main.dart';
import 'package:flutter_app_demo/Views/splash_login_screen.dart';
import 'package:flutter_app_demo/api/api.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:intl/intl.dart';
class MatchesTabScreen extends StatefulWidget {
  final List<OneMatches> dataMatches;
  final String title;
  const MatchesTabScreen({Key? key, required this.dataMatches, required this.title}) : super(key: key);

  @override
  _MatchesTabScreenState createState() => _MatchesTabScreenState();
}

class _MatchesTabScreenState extends State<MatchesTabScreen> {
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
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 25, bottom: 20, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
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
                  return ListView.builder(
                    itemCount: widget.dataMatches.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
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
                                          String dateTemp = widget.dataMatches[index].time.toString();
                                          String dateWithT = dateTemp.substring(0, 8) + 'T' + dateTemp.substring(8);
                                          DateTime dateMatch = DateTime.parse(dateWithT);
                                          if(widget.dataMatches[index].status.toString()=="FT"){
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
                                                  widget.dataMatches[index].status.toString(),
                                                  style: const TextStyle(
                                                    color: Colors.indigo,
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                )
                                              ],
                                            );
                                          }else{
                                            if(widget.dataMatches[index].status.toString()=="NS"){
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
                                                widget.dataMatches[index].status.toString(),
                                                style: const TextStyle(
                                                  color: Colors.indigo,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              );
                                            }
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
                                                    widget.dataMatches[index].logoHomeTeam.toString(),
                                                    height: 25,
                                                    width: 25,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                widget.dataMatches[index].nameHomeTeam.toString().length > 20
                                                    ? Text(widget.dataMatches[index].nameHomeTeam
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
                                                  widget.dataMatches[index].nameHomeTeam.toString(),
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w600,

                                                  ),
                                                ),
                                              ],
                                            ),

                                            Text(
                                              widget.dataMatches[index].homeScore.toString(),
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
                                                    widget.dataMatches[index].logoAwayTeam.toString(),
                                                    height: 25,
                                                    width: 25,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                )
                                                ,
                                                widget.dataMatches[index].nameAwayTeam.toString().length > 20
                                                    ? Text(widget.dataMatches[index].nameAwayTeam
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
                                                  widget.dataMatches[index].nameAwayTeam.toString(),
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w600,

                                                  ),
                                                ),

                                              ],
                                            ),

                                            Text(
                                              widget.dataMatches[index].awayScore.toString(),
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
                                          if(dataOfUser.data.contains(widget.dataMatches[index].idHomeTeam) || dataOfUser.data.contains(widget.dataMatches[index].idAwayTeam)){
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
                                        DetailMainScreen(idMatch: widget.dataMatches[index].idMatch.toString())
                                )
                            );
                          }
                      );
                    },

                  );
                }
            )


          ],
        )
      ],
    );
  }
}
