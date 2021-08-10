import 'package:flutter/material.dart';
import 'package:pw/ProjectWork/mybb/slideitem.dart';

class selectionpage extends StatefulWidget {

  @override
  _selectionpageState createState() => _selectionpageState();
}

class _selectionpageState extends State<selectionpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/backgroundimage4.jpg"),
          fit: BoxFit.fill
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text("My BB", style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w500, color: Colors.pink))
        ),
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            SizedBox(height:50),
            SizedBox(
              height: 100,
              child: Text("   Select your BB to start your BB \n                        journey!",
              style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w500, color: Colors.black ))
            ),
            SizedBox(height:50),
            buildNewsList(context),
          ]
        ),
      ),
    );
  }
  buildNewsList(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 1.4,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: bbs.length,
          itemBuilder: (BuildContext context, int index) {
            Map cat = bbs[index];
            return Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: CategoryItem(
                  cat : cat
              ),
            );
          },
        ));
  }
  
}

List bbs = [
  {
    "img" : 'images/professionalbb.jpeg',
    'title': 'Professional BB',
  },
  {
    "img" : 'images/passionatebb.jpeg',
    'title': 'Passionate BB',
  },
  {
    "img" : 'images/lovingbb.jpeg',
    'title': 'Loving BB',
  },
  {
    "img" : 'images/compassionatebb.jpeg',
    'title': 'Compassionate BB',
  }
];
