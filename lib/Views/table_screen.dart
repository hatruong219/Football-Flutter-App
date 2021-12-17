import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Views/TableChildScreen/table_child_screen.dart';
import 'TableChildScreen/language_container.dart';

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
              Color.fromRGBO(160, 223, 255, 1),
              Color.fromRGBO(160, 223, 255, 1),
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
                  height: 80,
                ),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 50,
                  children: [
                    GestureDetector(
                      child: const LanguageContainer(
                          imageLanguage: 'assets/images/premier.png'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const TableChildScreen(code: 'PL'),
                            ));
                      },
                    ),
                    GestureDetector(
                      child: const LanguageContainer(
                          imageLanguage: 'assets/images/laliga.png'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const TableChildScreen(code: 'PD'),
                            ));
                      },
                    ),
                    GestureDetector(
                      child: const LanguageContainer(
                          imageLanguage: 'assets/images/seria.png'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const TableChildScreen(code: 'SA'),
                            ));
                      },
                    ),
                    GestureDetector(
                      child: const LanguageContainer(
                          imageLanguage: 'assets/images/bundes.png'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const TableChildScreen(code: 'BL1'),
                            ));
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
