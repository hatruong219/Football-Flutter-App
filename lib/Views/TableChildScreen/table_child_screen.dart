import 'dart:convert';
// import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;


//create Model
class ClubOfTable {
  final String name, img;
  final int position, played, win, draw, lost, gd, points;

  ClubOfTable(this.name, this.img, this.position, this.played, this.win, this.draw, this.lost, this.gd, this.points);


}

class TableChildScreen extends StatefulWidget {
  final String code;
  const TableChildScreen({Key? key, required this.code}) : super(key: key);

  @override
  _TableChildScreenState createState() => _TableChildScreenState();
}


class _TableChildScreenState extends State<TableChildScreen> {
  // get api
  Future<List<ClubOfTable>> getApiData() async {
    var response = await http.get(Uri.parse(
        'http://api.football-data.org/v2/competitions/${widget
            .code}/standings'),
        headers: {'X-Auth-Token': '86014f6025ae430dba078acc94bb2647'});
    var jsonData = jsonDecode(response.body);
    var dataOfTable = jsonData["standings"][0]['table'];
    List<ClubOfTable> dataTable = [];

    for (var club in dataOfTable) {
      ClubOfTable oneClub = ClubOfTable(
          club['team']['name'],
          club['team']['crestUrl'],
          club['position'],
          club['playedGames'],
          club['won'],
          club['draw'],
          club['lost'],
          club['goalDifference'],
          club['points']);
      dataTable.add(oneClub);
    }
    // ignore: avoid_print
    print("Hello: $dataTable.length");
    return dataTable;
  }


  // late List _table;
  //
  // getTable() async {
  //   try {
  //     http.Response response = await http.get(
  //         Uri.parse(
  //             'http://api.football-data.org/v2/competitions/${widget.code}/standings'),
  //         headers: {'X-Auth-Token': '86014f6025ae430dba078acc94bb2647'});
  //     String body = response.body;
  //     Map data = jsonDecode(body);
  //     List table = data['standings'][0]['table'];
  //     setState(() {
  //       _table = table;
  //     });
  //   } catch (e) {
  //     print(e);
  //     rethrow;
  //   }
  // }
  //
  // Widget buildTable() {
  //   List<Widget> teams = [];
  //   for (var team in _table) {
  //     teams.add(
  //       Padding(
  //         padding: const EdgeInsets.all(10),
  //         child: Row(
  //           children: [
  //             Expanded(
  //               child: Row(
  //                 children: [
  //                   team['position'].toString().length > 1
  //                       ? Text(team['position'].toString() + ' - ')
  //                       : Text(" " + team['position'].toString() + ' - '),
  //                   Row(
  //                     children: [
  //                       SvgPicture.network(
  //                         team['team']['crestUrl'],
  //                         height: 30,
  //                         width: 30,
  //                       ),
  //                       team['team']['name'].toString().length > 11
  //                           ? Text(team['team']['name']
  //                                   .toString()
  //                                   .substring(0, 11) +
  //                               '...')
  //                           : Text(team['team']['name'].toString()),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Expanded(
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(team['playedGames'].toString()),
  //                   Text(team['won'].toString()),
  //                   Text(team['draw'].toString()),
  //                   Text(team['lost'].toString()),
  //                   Text(team['goalDifference'].toString()),
  //                   Text(team['points'].toString()),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
  //   }
  //   return Column(
  //     children: teams,
  //   );
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   getTable();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            tooltip: 'Go to the next page',
            onPressed: () {}),
        title: const Text('BXH'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: const [
                        Text(
                          'STT',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Club',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'PL',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'W',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'D',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'L',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'GD',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Pts',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder(
              future: getApiData(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.data == null){
                  return const Center(
                    child: Text(
                        'Loading ...'
                    ),
                  );
                }
                else {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, index){
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    snapshot.data[index].position.toString().length > 1
                                        ? Text(snapshot.data[index].position.toString() + ' - ')
                                        : Text(" " + snapshot.data[index].position.toString() + ' - '),
                                    Row(
                                      children: [
                                        SvgPicture.network(
                                          snapshot.data[index].img.toString(),
                                          height: 30,
                                          width: 30,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        snapshot.data[index].name.toString().length > 11
                                            ? Text(snapshot.data[index].name
                                            .toString()
                                            .substring(0, 11) +
                                            '...')
                                            : Text(snapshot.data[index].name.toString()),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(snapshot.data[index].played.toString()),
                                    Text(snapshot.data[index].win.toString()),
                                    Text(snapshot.data[index].draw.toString()),
                                    Text(snapshot.data[index].lost.toString()),
                                    Text(snapshot.data[index].gd.toString()),
                                    Text(snapshot.data[index].points.toString()),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                  );
                }
              },



            )
          ],
        ),
      )
    );
  }
}




//   @override
//   Widget build(BuildContext context) {
//     return _table == null
//         ? Container(
//             color: Colors.white,
//             child: const Center(
//               child: CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation<Color>(
//                   Color(0xFFe70066),
//                 ),
//               ),
//             ),
//           )
//         : Scaffold(
//             appBar: AppBar(
//               leading: IconButton(
//                   icon: const Icon(Icons.arrow_back_outlined),
//                   tooltip: 'Go to the next page',
//                   onPressed: () {}),
//               title: const Text('BXH'),
//               centerTitle: true,
//             ),
//             body: Container(
//               decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                 colors: [
//                   Color(0xffe3f2fd),
//                   Color(0xffe3f2fd),
//                 ],
//                 begin: FractionalOffset(0.0, 0.0),
//                 end: FractionalOffset(0.0, 1.0),
//                 stops: [0.0, 1.0],
//                 tileMode: TileMode.clamp,
//               )),
//               child: ListView(
//                 physics: const BouncingScrollPhysics(
//                     parent: AlwaysScrollableScrollPhysics()),
//                 children: [
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: Row(
//                             children: const [
//                               Text(
//                                 'STT',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(
//                                 width: 20,
//                               ),
//                               Text(
//                                 'Club',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: const [
//                               Text(
//                                 'PL',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                 'W',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                 'D',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                 'L',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                 'GD',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                 'Pts',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   buildTable(),
//                 ],
//               ),
//             ),
//           );
//   }
// }
// }



