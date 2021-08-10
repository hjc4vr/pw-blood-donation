import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class news2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StateTomato();
}
final List<String> details = <String>['Tag: fruit', 'Binomial Name: Solanum lycopersicum', 'Taxon: Species','Description: The tomato is the fruit of the tomato plant, a member of the Nightshade family (Solanaceae). The fruit grows on a small compact bush.','Sun Requirements: Full Sun','Growing Days: 60 Days','Sowing Method: Direct seed indoors, transplant seedlings outside after hardening off','Spread (diameter): 45 centimeters','Row Spacing: 45 centimeters','Height: 45 centimeters'];
final List<int> colorCodes = <int>[100, 500, 100, 500, 100, 500, 100, 500, 100, 500];
class StateTomato extends State<news2>{
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
                  'Community Blood Drives',
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
                      child: new Text("2021/5/12"),
                    )
                  ],
                ),
                new Container(
                  width: double.infinity,
                  height: 250.0,
                  margin: new EdgeInsets.all(10.0),
                  child: new Image.asset(
                    "images/new2.png",
                    fit: BoxFit.cover,
                  ),
                ),
                new Text(
                  """Precautionary measures will also be strictly adhered to at our Community Blood Drives. We strongly encourage you to schedule an appointment by calling us to book a timeslot.
                [In light of the current COVID-19 situation, we will be implementing crowd control measures at the blood donation venue, including staggering entry into the venue as necessary. We seek your patience and understanding on this matter.

                Donors with appointments will be given priority and we will do our best to attend to you at your time slot.

                For donors who walk in, additional waiting time is expected as priority will be given to donors who have made appointments. In the event of overwhelming response, we seek your understanding as we may not be able to accept walk ins due to safe distancing measures.]""",
                  style: new TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            )
        ));
  }

}