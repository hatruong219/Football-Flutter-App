import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Views/DetailScreen/goal_status.dart';
import 'package:flutter_app_demo/Views/DetailScreen/team_status.dart';

class DetailMainScreen extends StatefulWidget {
  @override
  _DetailMainScreenState createState() => _DetailMainScreenState();
}

class _DetailMainScreenState extends State<DetailMainScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
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
          color: Color.fromRGBO(160, 223, 255, 1),
          child: ListView(
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
                            child: const Text(
                              "Sun, 21/11/2021",
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
                      TeamStatus("team", "assets/images/premier.png", "Manchester United"),
                      GoalStatus(50, 1, 2),
                      TeamStatus("team", "assets/images/premier.png", "Manchester City"),
                    ],
                  ),
                  Container(
                    child: TabBar(
                      controller: _tabController,
                      tabs:const [
                        Tab(text: "Tab 1",),
                        Tab(text: "Tab 2",),
                        Tab(text: "Tab 3",),
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
                      ],
                    ),
                  ),
                ],
              ),
              Text("data")
            ],
          ),

        )
    );
  }
}

