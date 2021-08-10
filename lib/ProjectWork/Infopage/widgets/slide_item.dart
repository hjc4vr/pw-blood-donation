import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:pw/ProjectWork/Infopage/utils/const.dart';

class SlideItem extends StatefulWidget {
  Map cat;
  SlideItem(this.cat);

  @override
  _SlideItemState createState() => _SlideItemState(cat);
}

class _SlideItemState extends State<SlideItem> {
  @override
  Map cat;
  _SlideItemState(this.cat);
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 2.9,
        width: MediaQuery.of(context).size.width / 1.2,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 3.0,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  InkWell(
                    onTap: (){Navigator.pushNamed(context, cat['route']);},
                  child : Container(
                    height: MediaQuery.of(context).size.height / 3.7,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                      child: Image.asset(
                        "${cat["img"]}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),)
                ],
              ),
              SizedBox(height: 7.0),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "${cat["title"]}",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(height: 7.0),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}


