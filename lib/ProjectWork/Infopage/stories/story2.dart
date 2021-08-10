import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class story2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StateTomato();
}
final List<String> details = <String>['Tag: fruit', 'Binomial Name: Solanum lycopersicum', 'Taxon: Species','Description: The tomato is the fruit of the tomato plant, a member of the Nightshade family (Solanaceae). The fruit grows on a small compact bush.','Sun Requirements: Full Sun','Growing Days: 60 Days','Sowing Method: Direct seed indoors, transplant seedlings outside after hardening off','Spread (diameter): 45 centimeters','Row Spacing: 45 centimeters','Height: 45 centimeters'];
final List<int> colorCodes = <int>[100, 500, 100, 500, 100, 500, 100, 500, 100, 500];
class StateTomato extends State<story2>{
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
                  'Father of two thanks blood donors who saved his life',
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
                      child: new Text("2021/6/12"),
                    )
                  ],
                ),
                new Container(
                  width: double.infinity,
                  height: 250.0,
                  margin: new EdgeInsets.all(10.0),
                  child: new Image.asset(
                    "images/story2.png",
                    fit: BoxFit.cover,
                  ),
                ),
                new Text(
                """Tyler Bacon met some of the people who donated blood and platelets while he was being treated for cancer at UCLA
    As Tyler Bacon gripped the lectern in Carnesale Commons and scanned the crowd gazing at him expectantly, he struggled to hold back tears.
    The 39-year-old father of two from Thousand Oaks was finally meeting some of the more than two dozen people whose blood and platelet donations sustained his life during cancer treatment at Ronald Reagan UCLA Medical Center.""",

                  style: new TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            )
        ));
  }

}