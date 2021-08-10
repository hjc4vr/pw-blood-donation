import 'dart:math';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:pw/ProjectWork/Infopage/Screens/main_screen.dart';
import 'package:pw/ProjectWork/map/map_with_popup.dart';
import 'package:pw/ProjectWork/map/farm_entity.dart';
import 'package:pw/ProjectWork/calendar/calendarmain.dart';
import 'package:pw/ProjectWork/forum/mainscreen.dart';
import 'package:pw/ProjectWork/mybb/selection.dart';

class HomeScreen extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 2;
  final List<Widget> _children = [
    BlankPage(), //interactive map
    BlankPage(), //mentorship
    BlankPage(), //plants info
    BlankPage(), //groups overview
    BlankPage() //marketplace
  ];
  _HomeScreenState(){
    _children[2] = PlantInfoMainScreen();
    _children[0] = MapWithPopups(felist: defaultfelist);
    _children[1] = calendarhome();
    _children[3] = forum();
    _children[4] = selectionpage();
  }
  static const IconData calendar_today_sharp = IconData(0xe81f, fontFamily: 'MaterialIcons');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
          index: _currentIndex,
          height: 65.0,
          items: <Widget>[
            Icon(Icons.map_outlined, size: 40), //interactive map
            Icon(calendar_today_sharp, size: 40), //mentorship
            Icon(Icons.home_outlined, size: 40), //plants info
            Icon(Icons.people_outlined, size: 40), //groups overview
            Icon(Icons.videogame_asset, size: 40), //marketplace
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          color: Colors.cyanAccent.shade400,
          buttonBackgroundColor: Colors.redAccent,
          backgroundColor: Colors.cyan.shade100,
          animationCurve: Curves.easeInOutSine,
          animationDuration: Duration(milliseconds: 300),
          letIndexChange: (index) => true),
    );
  }
}

class BlankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(Random().nextInt(255), Random().nextInt(255),
          Random().nextInt(255), Random().nextInt(255)),
    );
  }
}


List<FarmEntity> defaultfelist = [
  FarmEntity(
      id: 0,
      type: 0,
      lat: 1.280200,
      long: 103.837670,
      name: "Health Sciences Authority",
      imagePath:
      "images/220px-Health_Sciences_Authority_2008.jpg"),
  FarmEntity(
      id: 0,
      type: 0,
      lat: 1.299010,
      long: 103.846060,
      name: "Dhoby Xchange",
      imagePath:
      "images/genimage.jpg"),
  FarmEntity(
      id: 0,
      type: 0,
      lat: 1.435480,
      long: 103.787529,
      name: "Woodlands Civic Centre",
      imagePath:
      "images/woodlands-civic-centre-singapore.jpg"),
  FarmEntity(
      id: 0,
      type: 0,
      lat: 1.335480,
      long: 103.741920,
      name: "Westgate Tower",
      imagePath:
      "images/Westgate-cls-up-view-L16-R-773x1030.jpg"),
];

List<FarmEntity> failfelist = [
  FarmEntity(
    id: 1,
    type: 1,
    lat: 1.35,
    long: 103.8,
    name: "Connection to database unsuccessful!",
  ),
];

