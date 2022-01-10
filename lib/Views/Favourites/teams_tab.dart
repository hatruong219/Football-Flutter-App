import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Views/Favourites/matches_tab.dart';
import 'package:flutter_app_demo/Views/Favourites/select_clubs_screen.dart';
import 'package:flutter_app_demo/Views/main_screen.dart';
import 'package:flutter_app_demo/Views/splash_login_screen.dart';
import 'package:flutter_app_demo/api/api.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class OneClubs {
  final String id;
  final String idClubs;
  final String logo;
  final String name;
  final String league;
  final String country;

  OneClubs(
      this.id, this.idClubs, this.logo, this.name, this.league, this.country);
}


class TeamFavouritesTab extends StatefulWidget {
  @override
  _TeamFavouritesTabState createState() => _TeamFavouritesTabState();
}

class _TeamFavouritesTabState extends State<TeamFavouritesTab> {
  void updateDataApi(String idClubs) async {
    print("lll:"+idClubs);
    Map body = {"id_clubs": idClubs.toString()};
    var response = await http.post(Uri.parse(
        '$linkApi/api/clubs/list/${finalEmail}/update'), body: body
    );
    if(response.statusCode == 200){
      print("okokokok");
    }
  }

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

  Future<List<OneClubs>> getDataApi() async{
    var response = await http.get(Uri.parse(
        '$linkApi/api/clubs/list'),
    );
    var jsonData = jsonDecode(response.body);
    List<OneClubs> listClubs = [];
    for(var club in jsonData) {
      OneClubs temp = OneClubs(
        club["id"],
        club["id_clubs"],
        club["logo"],
        club["name"],
        club["league"],
        club["country"],
      );
      listClubs.add(temp);
    }
    return listClubs;

  }

  Color _iconColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    if(finalEmail != null){
      return hasAccount();
    }else{
      return noAccount();
    }
  }

  Widget noAccount(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),

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
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 20),
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(width: 1,color: Colors.black)
            ),
            child: InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Add Teams "),
                  Icon(
                      Icons.add
                  )
                ],
              ),
              onTap: () {

              },
            ),
          )
        ],
    );
  }

  Widget hasAccount() {
    return SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 20),
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(width: 1,color: Colors.black)
              ),
              child: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Add Teams "),
                    Icon(
                        Icons.add
                    )
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectClubsScreen(),
                      ));
                },
              ),
            ),

            SizedBox(height: 10,),
            FutureBuilder(
                future: getArrayOfUser(),
                builder: (BuildContext context, AsyncSnapshot dataOfUser){
                  return FutureBuilder(
                    future: getDataApi(),
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
                            if(dataOfUser.data.contains(snapshot.data[index].idClubs)){
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
                                                child: Container(
                                                  padding: const EdgeInsets.only(left: 5, right: 5),
                                                  child: Image.network(
                                                    snapshot.data[index].logo.toString(),
                                                    height: 25,
                                                    width: 25,
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
                                                    Text(
                                                      snapshot.data[index].name.toString(),
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 22,
                                                        fontWeight: FontWeight.w600,

                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      snapshot.data[index].league.toString(),
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17,
                                                        fontWeight: FontWeight.w600,

                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          // space
                                          // Icon favourites
                                          Expanded(
                                              flex: 2,
                                              child: ((){
                                                //hasValue.contains()
                                                if(dataOfUser.data==null){
                                                  _iconColor = Colors.grey;
                                                  return IconButton(onPressed: (){
                                                    updateDataApi(snapshot.data[index].idClubs);
                                                    setState(() {
                                                      if(_iconColor == Colors.red){
                                                        _iconColor = Colors.grey;
                                                      }else{
                                                        _iconColor = Colors.red;
                                                      }

                                                    });
                                                  },
                                                      icon: Icon(
                                                        Icons.notifications,
                                                        size: 26,
                                                        color: _iconColor,
                                                      ));
                                                }
                                                else{
                                                  if(dataOfUser.data.contains(snapshot.data[index].idClubs)){
                                                    _iconColor = Colors.red;
                                                    return IconButton(onPressed: (){
                                                      updateDataApi(snapshot.data[index].idClubs);
                                                      setState(() {
                                                        if(_iconColor == Colors.red){
                                                          _iconColor = Colors.grey;
                                                        }else{
                                                          _iconColor = Colors.red;
                                                        }

                                                      });
                                                    },
                                                        icon: Icon(
                                                          Icons.notifications,
                                                          size: 26,
                                                          color: _iconColor,
                                                        ));
                                                  }else{
                                                    _iconColor = Colors.grey;
                                                    return IconButton(onPressed: (){
                                                      updateDataApi(snapshot.data[index].idClubs);
                                                      setState(() {
                                                        if(_iconColor == Colors.red){
                                                          _iconColor = Colors.grey;
                                                        }else{
                                                          _iconColor = Colors.red;
                                                        }

                                                      });
                                                    },
                                                        icon: Icon(
                                                          Icons.notifications,
                                                          size: 26,
                                                          color: _iconColor,
                                                        ));
                                                  }
                                                }
                                              }())
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTap: (){
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context)=>
                                    //             DetailMainScreen(idMatch: snapshot.data[index].idMatch.toString())
                                    //     )
                                    // );
                                  }
                              );
                            }else{
                              return SizedBox(height: 0,);
                            }


                          },
                        );
                      }


                    },
                  );
                }),

          ],
        )
    );
  }
}
