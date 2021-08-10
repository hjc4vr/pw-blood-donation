import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class news3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StateTomato();
}
final List<String> details = <String>['Tag: fruit', 'Binomial Name: Solanum lycopersicum', 'Taxon: Species','Description: The tomato is the fruit of the tomato plant, a member of the Nightshade family (Solanaceae). The fruit grows on a small compact bush.','Sun Requirements: Full Sun','Growing Days: 60 Days','Sowing Method: Direct seed indoors, transplant seedlings outside after hardening off','Spread (diameter): 45 centimeters','Row Spacing: 45 centimeters','Height: 45 centimeters'];
final List<int> colorCodes = <int>[100, 500, 100, 500, 100, 500, 100, 500, 100, 500];
class StateTomato extends State<news3>{
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
                  'BLOOD DONATION COVID-19 UPDATES',
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
                      child: new Text("2021/4/4"),
                    )
                  ],
                ),
                new Container(
                  width: double.infinity,
                  height: 250.0,
                  margin: new EdgeInsets.all(10.0),
                  child: new Image.asset(
                    "images/news3.png",
                    fit: BoxFit.cover,
                  ),
                ),
                new Text(
                   """ All our blood banks will remain open from 7 April to 1 June 2020 even as Singapore implements elevated safe distancing measures. Blood donation is an essential service and the need for blood products never stops.
                We strongly urge donors who are healthy and eligible to come to our blood banks to continue donating blood. To shorten your time spent at the blood bank, we encourage you to make an appointment before coming.
                For those who have answered our call for blood donation during the current situation, we would like to say a big thank you for your selfless contribution. We look forward to seeing you again in three months’ time. In the meantime, stay safe and united – we will see this through together!
                    ADDITIONAL PRECAUTIONARY MEASURES FOR SAFE BLOOD DONATION SITES
                    To ensure that all blood donation sites remain a safe environment for all, we have put in place these precautionary measures:
                Check in and out using SafeEntry
                    Mandatory temperature checks and health screening, including:
                No fever in the past 28 days
                No respiratory symptoms (cough, sore throat, runny nose) in the last 7 days
        No overseas travel in the past 21 days
        No contact with suspected or diagnosed COVID-19 patients
        Active crowd management and strict safe distancing measures aligned with the Ministry of Health’s guidelines
        Increased frequency of cleaning at our blood banks and all staff will be required to wear a mask for the safety of all blood donors.
        Only donors are allowed to enter the blood banks
        As blood has a short shelf life (6 weeks for red cells and 5 days for platelets), we urge donors to donate at regular intervals to help us ensure a constant supply of safe blood. """,
        style: new TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            )
        ));
  }

}