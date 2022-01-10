import 'dart:ffi';

import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Views/DetailScreen/detail_main_screen.dart';
import 'package:flutter_app_demo/icon/app_icon_custom_icons.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
class SummaryMatchTab extends StatelessWidget {
  final List<OneSummary> summaryMatch;
  const SummaryMatchTab({Key? key, required this.summaryMatch}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int homeScore =0;
    int awayScore = 0;
    return Container(
      child: ListView.builder(
          itemCount: summaryMatch.length,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, index) {
            print(summaryMatch[index].min);
            if(summaryMatch[index].levelStatus=="36" || summaryMatch[index].levelStatus=="37" || summaryMatch[index].levelStatus=="39"){
              if(summaryMatch[index].numTeam=="1"){
                homeScore+=1;
              }
              if(summaryMatch[index].numTeam=="2"){
                awayScore+=1;
              }
            }
            return Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                height: 45,
                color: Colors.white38,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text(( () {
                          if(summaryMatch[index].min=="Nst"){
                            return "HT";
                          }else{
                            if(summaryMatch[index].minEx=="Nst"){
                              return summaryMatch[index].min+"'";
                            }else{
                              return summaryMatch[index].min+"+"+summaryMatch[index].minEx+"'";
                            }
                          }
                        })(),
                          style:const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,)
                    ),
                    Expanded(
                      flex: 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ((){
                            if(summaryMatch[index].numTeam=="1"){
                              if(summaryMatch[index].player.length < 18){
                                return Text(summaryMatch[index].player,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }else{
                                return Text(summaryMatch[index].player,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }
                            }else{
                              return const Text("");
                            }
                          }()),

                          if(summaryMatch[index].numTeam=="1")
                            Padding(padding: const EdgeInsets.only(right: 15, left: 10),
                              child: Icon(((){
                                if(summaryMatch[index].levelStatus=="36" || summaryMatch[index].levelStatus=="37" || summaryMatch[index].levelStatus=="39"){
                                  return Icons.sports_soccer;
                                }else{
                                  return Icons.sim_card_alert;
                                }
                              })(),
                                size: 15,
                              ),
                            )
                          else
                            const Text(""),
                        ],

                      ),
                      // child: Text(summaryMatch[index].numTeam=="1"?summaryMatch[index].player:"",
                      //   style: TextStyle(
                      //     fontSize: 13,
                      //     fontWeight: FontWeight.bold,
                      //
                      //   ),
                      //   textAlign: TextAlign.right,
                      // )
                    ),
                    Expanded(
                        flex: 1,
                      child:  Text(( () {
                        if(summaryMatch[index].levelStatus=="36" || summaryMatch[index].levelStatus=="37" || summaryMatch[index].levelStatus=="39"){
                          return homeScore.toString()+ " - " + awayScore.toString();
                        }else{
                          return "";
                        }
                      }()),
                        style:const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                        flex:4,
                        child: Row(
                          children: [
                            if (summaryMatch[index].numTeam=="2")
                              Padding(padding: const EdgeInsets.only(right: 15, left: 10),
                                child: Icon(((){
                                  if(summaryMatch[index].levelStatus=="36" || summaryMatch[index].levelStatus=="37" || summaryMatch[index].levelStatus=="39"){
                                    return Icons.sports_soccer;
                                  }else{
                                    return Icons.sim_card_alert;
                                  }
                                })(),
                                  size: 15,
                                ),
                              )
                            else
                              const Text(""),
                            // if (summaryMatch[index].numTeam=="2")
                            //   Text(summaryMatch[index].numTeam=="2"?summaryMatch[index].player:"",
                            //     style: const TextStyle(
                            //       fontSize: 13,
                            //       fontWeight: FontWeight.bold,
                            //     ),
                            //   )
                            // else
                            //   const Text(""),

                            ((){
                              if(summaryMatch[index].numTeam=="2"){
                                if(summaryMatch[index].player.length < 18){
                                  return Text(summaryMatch[index].player,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }else{
                                  return Text(summaryMatch[index].player,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }
                              }else{
                                return const Text("");
                              }
                            }())
                          ],
                        )
                    ),

                  ],
                )
            );
            // return Text("o"+index.toString()+summaryMatch[index].player);
          }
      ),
    );

  }
}
