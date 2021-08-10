import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pw/ProjectWork/loginfile/LoginFile.dart';
import 'package:pw/ProjectWork/Infopage/stories/story1.dart';
import 'package:pw/ProjectWork/Infopage/stories/story2.dart';
import 'package:pw/ProjectWork/Infopage/stories/story3.dart';
import 'package:pw/ProjectWork/Infopage/stories/story4.dart';
import 'package:pw/ProjectWork/Infopage/news/news1.dart';
import 'package:pw/ProjectWork/Infopage/news/news2.dart';
import 'package:pw/ProjectWork/Infopage/news/news3.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pw/ProjectWork/forum/mainscreen.dart';
void main() {
  runApp(ProviderScope(child: MyApp()));
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/1': (context) =>  story1(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/2': (context) =>  story2(),
        '/3' : (context) =>  story3(),
        '/4' : (context) =>  story4(),
        '/5' : (context) => news1(),
        '/6' : (context) => news2(),
        '/7' : (context) => news3(),
      },
    );
  }
}

