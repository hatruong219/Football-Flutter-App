import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_app_demo/Views/SoccerChildScreen/after_tomorrow_screen.dart';
import 'package:flutter_app_demo/Views/SoccerChildScreen/before_yesterday_screen.dart';
import 'package:flutter_app_demo/Views/SoccerChildScreen/today_screen.dart';
import 'package:flutter_app_demo/Views/SoccerChildScreen/tomorrow_screen.dart';
import 'package:flutter_app_demo/Views/SoccerChildScreen/yesterdayscreen.dart';

class SoccerScreen extends StatefulWidget {
  const SoccerScreen({Key? key}) : super(key: key);

  @override
  _SoccerScreenState createState() => _SoccerScreenState();
}

class _SoccerScreenState extends State<SoccerScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    super.initState();

    controller = TabController(length: 5, vsync: this, initialIndex: 2);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
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
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  tooltip: 'Show Snackbar',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('This is a snackbar')));
                  },
                ),
              ],
              bottom: TabBar(
                controller: controller,
                tabs: [
                  // Before Yesterday
                  Tab(
                    child: Column(
                      children: [
                        Text(
                          DateFormat.E().format(
                              DateTime.now().subtract(Duration(days: 2))),
                          style: TextStyle(),
                        ),
                        Text(DateFormat.MMMd().format(
                            DateTime.now().subtract(Duration(days: 2)))),
                      ],
                    ),
                  ),
                  // Yesterday
                  Tab(
                    child: Column(
                      children: [
                        Text(
                          DateFormat.E().format(
                              DateTime.now().subtract(Duration(days: 1))),
                          style: TextStyle(),
                        ),
                        Text(DateFormat.MMMd().format(
                            DateTime.now().subtract(Duration(days: 1)))),
                      ],
                    ),
                  ),
                  // Today
                  Tab(
                    child: Column(
                      children: [
                        Text(
                          'Today',
                          style: TextStyle(),
                        ),
                        Text(DateFormat.MMMd().format(DateTime.now())),
                      ],
                    ),
                  ),
                  // Tomorrow
                  Tab(
                    child: Column(
                      children: [
                        Text(
                          DateFormat.E()
                              .format(DateTime.now().add(Duration(days: 1))),
                          style: TextStyle(),
                        ),
                        Text(DateFormat.MMMd()
                            .format(DateTime.now().add(Duration(days: 1)))),
                      ],
                    ),
                  ),
                  // After Tomorrow
                  Tab(
                    child: Column(
                      children: [
                        Text(
                          DateFormat.E()
                              .format(DateTime.now().add(Duration(days: 1))),
                          style: TextStyle(),
                        ),
                        Text(DateFormat.MMMd()
                            .format(DateTime.now().add(Duration(days: 2)))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(controller: controller, children: [
          BeforeYesterdayScreen(),
          YesterdayScreen(),
          TodayScreen(),
          TomorrowScreen(),
          AfterTomorrowScreen(),
        ]),
      ),
    );
  }
}
