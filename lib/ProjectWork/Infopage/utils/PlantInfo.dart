import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tomato extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StateTomato();
}
final List<String> details = <String>['Tag: fruit', 'Binomial Name: Solanum lycopersicum', 'Taxon: Species','Description: The tomato is the fruit of the tomato plant, a member of the Nightshade family (Solanaceae). The fruit grows on a small compact bush.','Sun Requirements: Full Sun','Growing Days: 60 Days','Sowing Method: Direct seed indoors, transplant seedlings outside after hardening off','Spread (diameter): 45 centimeters','Row Spacing: 45 centimeters','Height: 45 centimeters'];
final List<int> colorCodes = <int>[100, 500, 100, 500, 100, 500, 100, 500, 100, 500];
class StateTomato extends State<Tomato>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text('Tiny Tim Tomato',
            style:TextStyle(color:Colors.black),),
            backgroundColor: Colors.white,
            leading: BackButton(
              color: Colors.black,
              onPressed: (){
                Navigator.pop(context);
              },
            ),

        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: details.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.amber[colorCodes[index]],
              child: Center(child: Text('${details[index]}')),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        )
    ));
  }

}
