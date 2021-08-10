import 'package:flutter/material.dart';
// import 'package:percent_indicator_example/sample_circular_page.dart';
// import 'package:percent_indicator_example/sample_linear_page.dart';
import 'package:percent_indicator/percent_indicator.dart';

class bbpage extends StatefulWidget {
  Map cat;
  bbpage(this.cat);

  @override
  _bbpageState createState() => _bbpageState(cat);
}

class _bbpageState extends State<bbpage> {
  @override
  Map cat;
  _bbpageState(this.cat);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("BB page"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
        body: ListView(
          children: [

            SizedBox(height:50),
            Center(child:new CircularPercentIndicator(
              backgroundColor: Colors.grey,
              radius: 120.0,
              lineWidth: 13.0,
              animation: true,
              percent: 0.7,
              center: new Text(
                "70.0%",
                style:
                new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              footer: new Text(
                "Level 10",
                style:
                new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.red,
            ),),
            SizedBox(
              height: 500,
              width: 400,
              child:Image.asset(
                cat["img"],
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.height / 4,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
                child: Text("   Tasks (Updated at 5am)",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25))
            ),
            Divider(),
            Card(
              child:ListTile(
                onTap: (){

                },
                  title: Text("${tasks[0]['text']}"),
                leading: Icon(Icons.access_time),
                 )),
            Card(
                child:ListTile(
                  onTap: (){

                  },
                  title: Text("${tasks[1]['text']}"),
                  leading: Icon(Icons.access_time),
                )),
            Card(
                child:ListTile(
                  leading: Icon(Icons.access_time),
                  onTap: (){

                  },
                  title: Text("${tasks[2]['text']}"),
                )),
        ]
    ),);
  }

}


List tasks = [
  {
    "text" : "BB Queries",
    "route" : ''
  },
  {
    "text" : 'Jumping BB',
    "route": '',
  },
  {
  "text" : 'Fat BB',
  "route": ''
  }
];