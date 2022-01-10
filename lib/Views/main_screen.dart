import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Views/favourites_screen.dart';
import 'package:flutter_app_demo/Views/new_screen.dart';
import 'package:flutter_app_demo/Views/soccer_screen.dart';
import 'package:flutter_app_demo/Views/table_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
String emailUser = "";
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}
SharedPreferences? sharedPreferences;

class _MainScreenState extends State<MainScreen> {

  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const SoccerScreen(),
    const FavouritesScreen(),
    const TableScreen(),
    const NewScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.yellow[700],
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            title: Text('Soccer'),
            icon: Icon(Icons.sports_soccer),
          ),
          BottomNavigationBarItem(
            title: Text('Favorites'),
            icon: Icon(Icons.star),
          ),
          BottomNavigationBarItem(
            title: Text('Table'),
            icon: Icon(Icons.calendar_today),
          ),
          BottomNavigationBarItem(
            title: Text('News'),
            icon: Icon(Icons.library_books),
          ),
          // BottomNavigationBarItem(
          //   title: Text('Refesh'),
          //   icon: Icon(Icons.refresh),
          // ),
        ],
      ),
    );
  }
}
