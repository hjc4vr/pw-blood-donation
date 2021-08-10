import 'package:flutter/material.dart';
import 'bbpage.dart';
class CategoryItem extends StatelessWidget {
  final Map cat;

  CategoryItem({required this.cat});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Stack(
          children: <Widget>[
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => bbpage(cat)),
                );
              },
              child : Container(
                height: MediaQuery.of(context).size.height / 1.7,
                width: MediaQuery.of(context).size.width/1.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  child:Image.asset(
                    cat["img"],
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.height / 4,
                    fit: BoxFit.cover,
                  ),
                ),
              ),),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.2, 0.7],
                  colors: [Colors.transparent,Colors.transparent],
                  // [
                  //   cat['color1'],
                  //   cat['color2'],
                  // ],
                  // stops: [0.0, 0.1],
                ),
              ),
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.height / 6,
            ),
            // Center(
            //   child: Container(
            //     height: MediaQuery.of(context).size.height / 6,
            //     width: MediaQuery.of(context).size.height / 6,
            //     padding: const EdgeInsets.all(1),
            //     constraints: BoxConstraints(
            //       minWidth: 20,
            //       minHeight: 20,
            //     ),
            //     child: Center(
            //       child: Text(
            //         cat["title"],
            //         style: TextStyle(
            //           color: Colors.teal,
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold,
            //         ),
            //         textAlign: TextAlign.center,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}