import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Views/TableChildScreen/league_detail_main.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({Key? key}) : super(key: key);

  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          // padding: EdgeInsets.only(left: 5),
          icon: const Icon(Icons.settings),
          tooltip: 'Go to the next page',
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
        title: const Text('Live Score Football'),
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.white70,
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(0.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 25, left: 0, right: 0),
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
                            flex: 3,
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.only(left: 5, right: 5),
                                child: Image.asset(
                                  "assets/images/premier.png",
                                  height: 60,
                                  width: 60,
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
                                children:const [
                                  Text(
                                    "Premier League",
                                    style: TextStyle(
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
                                children:const [
                                  Text(
                                    "England",
                                    style: TextStyle(
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
                        const Expanded(
                            flex: 1,
                            child: SizedBox(),
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
                              LeagueDetailMainScreen(country: "england", league: "premier-league", title: "Premier League",)
                      )
                  );
                }
            ),
                GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 25, left: 0, right: 0),
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
                                flex: 3,
                                child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 5, right: 5),
                                    child: Image.asset(
                                      "assets/images/laliga.png",
                                      height: 60,
                                      width: 60,
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
                                    children:const [
                                      Text(
                                        "Laliga",
                                        style: TextStyle(
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
                                    children:const [
                                      Text(
                                        "Spain",
                                        style: TextStyle(
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
                            const Expanded(
                              flex: 1,
                              child: SizedBox(),
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
                                  LeagueDetailMainScreen(country: "spain", league: "laliga-santander", title: "La Liga",)
                          )
                      );
                    }
                ),
                GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 25, left: 0, right: 0),
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
                                flex: 3,
                                child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 5, right: 5),
                                    child: Image.asset(
                                      "assets/images/seria.png",
                                      height: 60,
                                      width: 60,
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
                                    children:const [
                                      Text(
                                        "Seria",
                                        style: TextStyle(
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
                                    children:const [
                                      Text(
                                        "Italy",
                                        style: TextStyle(
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
                            const Expanded(
                              flex: 1,
                              child: SizedBox(),
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
                                  LeagueDetailMainScreen(country: "italy", league: "serie-a", title: "Serie A",)
                          )
                      );
                    }
                ),
                GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 25, left: 0, right: 0),
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
                                flex: 3,
                                child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 5, right: 5),
                                    child: Image.asset(
                                      "assets/images/bundes.png",
                                      height: 60,
                                      width: 60,
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
                                    children:const [
                                      Text(
                                        "Bundesliga",
                                        style: TextStyle(
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
                                    children:const [
                                      Text(
                                        "Germany",
                                        style: TextStyle(
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
                            const Expanded(
                              flex: 1,
                              child: SizedBox(),
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
                                  LeagueDetailMainScreen(country: "germany", league: "bundesliga", title: "Bundesliga",)
                          )
                      );
                    }
                ),
                GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 25, left: 0, right: 0),
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
                                flex: 3,
                                child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 5, right: 5),
                                    child: Image.asset(
                                      "assets/images/ligue1.png",
                                      height: 60,
                                      width: 60,
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
                                    children:const [
                                      Text(
                                        "Ligue 1",
                                        style: TextStyle(
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
                                    children:const [
                                      Text(
                                        "France",
                                        style: TextStyle(
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
                            const Expanded(
                              flex: 1,
                              child: SizedBox(),
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
                                  LeagueDetailMainScreen(country: "france", league: "	ligue-1", title: "Ligue 1")
                          )
                      );
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
