import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class story4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StateTomato();
}
final List<String> details = <String>['Tag: fruit', 'Binomial Name: Solanum lycopersicum', 'Taxon: Species','Description: The tomato is the fruit of the tomato plant, a member of the Nightshade family (Solanaceae). The fruit grows on a small compact bush.','Sun Requirements: Full Sun','Growing Days: 60 Days','Sowing Method: Direct seed indoors, transplant seedlings outside after hardening off','Spread (diameter): 45 centimeters','Row Spacing: 45 centimeters','Height: 45 centimeters'];
final List<int> colorCodes = <int>[100, 500, 100, 500, 100, 500, 100, 500, 100, 500];
class StateTomato extends State<story4>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Story',
                style:TextStyle(color:Colors.black),),
              backgroundColor: Colors.white,
              leading: BackButton(
                color: Colors.black,
                onPressed: (){
                  Navigator.pop(context);
                },
              ),

            ),
            body: ListView(
              children: <Widget>[
                new Text(
                  'Jorge’s story',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                new Padding(
                  padding: new EdgeInsets.symmetric(vertical: 10.0),
                  child: new Divider(
                    height: 1.0,
                    color: Colors.black,
                  ),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Icon(
                      Icons.access_time,
                      color: Colors.grey,
                    ),
                    new Padding(
                      padding: new EdgeInsets.symmetric(horizontal: 10.0),
                      child: new Text("2021/3/12"),
                    )
                  ],
                ),
                new Container(
                  width: double.infinity,
                  height: 250.0,
                  margin: new EdgeInsets.all(10.0),
                  child: new Image.asset(
                    "images/story4.png",
                    fit: BoxFit.cover,
                  ),
                ),
                new Text(
               """ Jorge Sincuir, a frequent donor at the UCLA Blood & Platelet Center, who found himself in need of multiple blood transfusions following a near-fatal car accident.
    As UCLA undergraduates, brothers Jorge and Andrew Sincuir donated blood and platelets often. In fact, after Andrew learned that a patient responded well to his platelets, he began donating every two weeks, racking up 67 donations over four years.  """,

                  style: new TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            )
        ));
  }

}