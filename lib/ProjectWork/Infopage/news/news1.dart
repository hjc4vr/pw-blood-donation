import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class news1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StateTomato();
}
final List<String> details = <String>['Tag: fruit', 'Binomial Name: Solanum lycopersicum', 'Taxon: Species','Description: The tomato is the fruit of the tomato plant, a member of the Nightshade family (Solanaceae). The fruit grows on a small compact bush.','Sun Requirements: Full Sun','Growing Days: 60 Days','Sowing Method: Direct seed indoors, transplant seedlings outside after hardening off','Spread (diameter): 45 centimeters','Row Spacing: 45 centimeters','Height: 45 centimeters'];
final List<int> colorCodes = <int>[100, 500, 100, 500, 100, 500, 100, 500, 100, 500];
class StateTomato extends State<news1>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('News',
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
                  'Singapore Red Cross introduces refreshed Blood Buddy ‘BB’',
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
                      child: new Text("2021/1/25"),
                    )
                  ],
                ),
                new Container(
                  width: double.infinity,
                  height: 250.0,
                  margin: new EdgeInsets.all(10.0),
                  child: new Image.asset(
                    "images/new1.png",
                    fit: BoxFit.cover,
                  ),
                ),
                new Text(
                  """The mascot, affectionately known as 'BB', aims to reach and appeal to a younger generation of blood donors with a more modern and adorable image, and will be rolled out on public buses island-wide as well as social media.

Blood Buddy was first introduced in 2015 but the rebranding comes off the back of a need to engage and advocate blood donation among today's youth. This is also in line with the launch of the 'One More Step' campaign by the Singapore Red Cross, which encourages potential donors to take small, incremental steps towards the eventual goal of being a regular blood donor who donates at least twice in a year.
"Over the years, we've observed that many potential blood donors are deterred by prevailing misconceptions towards blood donation," said Prakash Menon, director of the blood donor programme at Singapore Red Cross.

"We also recognise the importance of inculcating the habit of giving blood from a young age, and we hope to encourage youth to adopt blood donation as a lifestyle. This is where Blood Buddy will be a lively and relatable voice of encouragement for those getting started on their blood donation journey.

As part of the campaign, a series of activations including videos and comic strips will be introduced to engage potential donors on social media.""",

                   style: new TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            )
        ));
  }

}
