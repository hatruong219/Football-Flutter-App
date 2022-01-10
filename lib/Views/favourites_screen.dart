import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Views/Favourites/teams_tab.dart';
import 'package:flutter_app_demo/Views/splash_login_screen.dart';

import 'Account/Welcome/welcome_screen.dart';
import 'Favourites/matches_tab.dart';
class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this, initialIndex: 0);
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
            title: const Text(
                "News"
            ),
            centerTitle: true,
          bottom: TabBar(

            controller: controller,
            indicatorColor: Colors.red,
            tabs: <Widget>[
              Tab(
                text: "Matches",
              ),
              Tab(
                text: "Favourites Teams",

              ),
            ],
          )
        ),
        body: TabBarView(
          controller: controller,
          children: <Widget>[
            MatchesFavouritesTab(),
            TeamFavouritesTab(),
          ],
        ),

    );
    // return Scaffold(
    //   appBar: AppBar(
    //     leading: IconButton(
    //       // padding: EdgeInsets.only(left: 5),
    //       icon: const Icon(Icons.settings),
    //       tooltip: '"""',
    //       onPressed: () {
    //         Navigator.push(context, MaterialPageRoute<void>(
    //           builder: (BuildContext context) {
    //             return Scaffold(
    //               appBar: AppBar(
    //                 title: const Text('Next page'),
    //               ),
    //               body: const Center(
    //                 child: Text(
    //                   'This is the next page',
    //                   style: TextStyle(fontSize: 24),
    //                 ),
    //               ),
    //             );
    //           },
    //         ));
    //       },
    //     ),
    //     title: const Text(
    //         "News"
    //     ),
    //     centerTitle: true,
    //   ),
    //   body: Container(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Container(
    //           width: double.maxFinite,
    //           color: Colors.red,
    //           child: TabBar(
    //             controller: controller,
    //
    //             isScrollable: true,
    //             labelColor: Colors.indigo,
    //             tabs:const [
    //               Tab(
    //                 child: Padding(
    //                   padding: EdgeInsets.symmetric(horizontal: 20),
    //                   child: Text(
    //                     "Matches",
    //                     style: TextStyle(
    //                       color: Colors.indigo,
    //                       fontSize: 17,
    //                       fontWeight: FontWeight.w700,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               Tab(
    //                 child: Padding(
    //                   padding: EdgeInsets.symmetric(horizontal: 20),
    //                   child: Text(
    //                     "Team Favorites",
    //                     style: TextStyle(
    //                       color: Colors.indigo,
    //                       fontSize: 17,
    //                       fontWeight: FontWeight.w700,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         Container(
    //           width: double.maxFinite,
    //           height: 570,
    //           child: TabBarView(
    //             controller: controller,
    //             children: [
    //               MatchesFavouritesTab(),
    //               Text("data 55"),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   )
    // );
  }
    // return Scaffold(
    //   body: NestedScrollView(
    //     headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
    //       return <Widget> [
    //         SliverAppBar(
    //           leading: IconButton(
    //             // padding: EdgeInsets.only(left: 5),
    //             icon: const Icon(Icons.settings),
    //             tooltip: 'Go to the next page',
    //             onPressed: () {
    //               Navigator.push(context, MaterialPageRoute<void>(
    //                 builder: (BuildContext context) {
    //                   return WelcomeScreen();
    //                 },
    //               ));
    //             },
    //           ),
    //           title: const Text('Favourites'),
    //           pinned: true,
    //           floating: false,
    //           forceElevated: innerBoxIsScrolled,
    //           centerTitle: true,
    //           bottom: TabBar(
    //             indicatorColor: Colors.green,
    //             unselectedLabelColor: Colors.white,
    //             labelColor: Colors.pink,
    //             controller: controller,
    //             tabs: const [
    //               // Before Yesterday
    //               Tab(
    //                 child: Text("Matches"),
    //               ),
    //               // Yesterday
    //               Tab(
    //                 child: Text("Favourites Team"),
    //               ),
    //             ],
    //
    //           ),
    //         )
    //       ];
    //     },
    //     body:SizedBox(
    //       width: double.maxFinite,
    //       height: 10,
    //       child: TabBarView(
    //         controller: controller, children: const [
    //         MatchesFavouritesTab(),
    //         Text("one one one"),
    //
    //       ],),
    //     )
    //
    //
    //
    //   ),
    //
    //
    // );

}



