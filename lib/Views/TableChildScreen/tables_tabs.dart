import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Views/TableChildScreen/league_detail_main.dart';

class TablesTabScreen extends StatefulWidget {
  final List<ClubOfTable> dataTables;
  final String title;
  const TablesTabScreen({Key? key, required this.dataTables, required this.title}) : super(key: key);

  @override
  _TablesTabScreenState createState() => _TablesTabScreenState();
}

class _TablesTabScreenState extends State<TablesTabScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: DataTable(
            horizontalMargin: 6.0,
            columnSpacing: 6.0,
            headingRowHeight: 70.0,
            dataRowHeight: 70.0,
            columns: [
              DataColumn(
                  label: Text(
                      '#',
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)
                  )),
              DataColumn(label: Text(
                  widget.title.toUpperCase(),
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
              )),
              DataColumn(label: Text(
                  'P',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
              )),
              DataColumn(label: Text(
                  'GD',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
              )),
              DataColumn(label: Text(
                  'PTS',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
              )),
            ],
            rows: getRow(widget.dataTables),
          ),
        )
      ],
    );
  }

 List<DataRow> getRow(List<ClubOfTable> listClubs) => listClubs
      .map((ClubOfTable club) => DataRow(
        cells: [
          DataCell(
              Text(club.position.toString())),
          DataCell(
              Row(
                children: [
                  Image.network(
                    club.img,
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(width: 10,),
                  Text(club.name.length>17?club.name.toString():club.name.toString()),
                ],
              )
          ),
          DataCell(
              Text(club.played.toString())
          ),
          DataCell(Text(club.gd.toString())),
          DataCell(Text(club.points.toString())),
        ]))
      .toList();
}
