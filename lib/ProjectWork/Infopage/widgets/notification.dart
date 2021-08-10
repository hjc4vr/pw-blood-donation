import 'package:flutter/material.dart';


class Notification_item extends StatefulWidget {
  Map cat;
  Notification_item({
    required this.cat
  });

  @override
  _TrendingItemState createState() => _TrendingItemState(cat);
}

class _TrendingItemState extends State<Notification_item> {
  @override
  Map cat;
  _TrendingItemState(this.cat);

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 2.5,
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 3.0,
          child: Column(
              children: [
                Container(
                  height: 100.0,
                  width: 100,//double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(cat['image']), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    cat['Title'],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  cat['details'] + " Starts at: ${cat['date']}" + ". Place: ${cat['place']}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                )
              ],

    ))));
  }
}