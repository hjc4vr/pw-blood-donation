import 'package:flutter/material.dart';
import 'package:pw/style.dart';
import 'AppointmentBooking.dart';
import 'optional.dart';
class calendarhome extends StatefulWidget {

  @override
  _calendarhomeState createState() => _calendarhomeState();
}

class _calendarhomeState extends State<calendarhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointment",style:TextStyle(fontSize:25,fontWeight:FontWeight.bold)),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          SizedBox(
            child: Image.asset('images/new1.png')
          ),
          SizedBox(height:100),
          ClickyButton(
              child: Text("Declare when you are free!"),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FormScreen()) //mentorship programme
                );
              }),
          SizedBox(height:50),
          ClickyButton(
            color: Colors.red,
              child: Text("Book your appointment!"),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            appointment()) //mentorship programme
                );

              })

        ],
      ),
    ));
  }
}

