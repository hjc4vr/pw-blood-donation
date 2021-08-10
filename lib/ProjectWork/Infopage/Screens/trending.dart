import 'package:flutter/material.dart';
import 'package:pw/ProjectWork/Infopage/Screens/home.dart';
import 'package:pw/ProjectWork/Infopage/widgets/AllNews_item.dart';
List icons = [
  Icons.home,
  Icons.label,
  Icons.add,
  Icons.notifications,
  Icons.person,
];

class Trending extends StatelessWidget {
  @override


  static const IconData delete_rounded =
      IconData(0xf697, fontFamily: 'MaterialIcons');

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Inbox"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 10.0,
        ),
        child: ListView(
          children: [
            SizedBox(height:10),
        Card(
        child: Column(
        mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.pending),
              title: Text('Invitation to events',style: TextStyle(fontSize: 20)),
              subtitle: Text('Dear Mr John, it will be our honour if you can participate in our nwe "School Blood Drives" event.'),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('Accept'),
                  onPressed: () {/* ... */},
                ),
                FlatButton(
                  child: const Text('Reject'),
                  onPressed: () {/* ... */},
                ),
              ],
            ),
          ],
        ),
      ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.pending),
                    title: Text('Invitation to donate',style: TextStyle(fontSize: 20)),
                    subtitle: Text('Dear Mr John, our blood bank is depleting in supply. We have arranged an appointment for you on next Wednesday 20/12/2021! Please indicate if you would like to accpet.'),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('Accept'),
                        onPressed: () {/* ... */},
                      ),
                      FlatButton(
                        child: const Text('Reject'),
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]
        )
      ),
    );
  }
}
