import 'package:flutter/material.dart';
import 'package:moives_app/HomeFragments/home_body.dart';
import 'package:moives_app/ThemeData.dart';

import '../../Screens/searchScreen.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List pages = [HomeBody(), searchScreen(), Browse(), WatchList()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyThemeData.primary,
        body: getScreen(),
        bottomNavigationBar: navTheme());
  }



  getScreen() {
    return selectedIndex == 0
        ? pages[0]
        : selectedIndex == 1
        ? pages[1]
        : selectedIndex == 3
        ? pages[3]
        : selectedIndex == 2
        ? pages[2]
        : Container();
  }

  List<BottomNavigationBarItem> navItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: 'SEARCH'),
    BottomNavigationBarItem(icon: Icon(Icons.movie_creation), label: 'BROWSE'),
    BottomNavigationBarItem(icon: Icon(Icons.save), label: 'WATCH LIST')
  ];

  Theme navTheme() {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: MyThemeData.accent),
      child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: MyThemeData.clicked,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: navItems),
    );
  }
}

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

class Browse extends StatelessWidget {
  const Browse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}

class WatchList extends StatelessWidget {
  const WatchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}
