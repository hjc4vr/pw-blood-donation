import 'package:pw/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_ui_toolkit/flutter_ui_toolkit.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'default.dart';
class FarmEntity {
  final int id;
  final int type;
  //type 0: existingGroup, 1: aspiringGroup, 2: availablePlot
  final double lat;
  final double long;
  final String name;
  final String description;
  final String imagePath;
  final String address;

  static double size = 40;
  static var farmColors = [Colors.purple, Colors.red, Colors.blue];
  static var typeNames = [
    "Donation Center",
//    "Available Plot"
  ];

  FarmEntity(
      {this.id = -1,
        this.type = 0,
        this.lat = 1.5,
        this.long = 103.5,
        this.name = "Unspecified name",
        this.description = "",
        this.imagePath =
        "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg",
        this.address = "No address provided"});
}

class FarmMarker extends Marker {
  FarmMarker({required this.farmentity})
      : super(
    anchorPos: AnchorPos.align(AnchorAlign.center),
    height: FarmEntity.size,
    width: FarmEntity.size,
    point: LatLng(farmentity.lat, farmentity.long),
    builder: (BuildContext ctx) => Icon(Icons.location_on,
        color: FarmEntity.farmColors[farmentity.type],
        size: FarmEntity.size),
  );

  final FarmEntity farmentity;
}

class FarmMarkerPopup extends StatefulWidget {
  const FarmMarkerPopup({Key? key, required this.farmentity}) : super(key: key);
  final FarmEntity farmentity;

  @override
  _FarmMarkerPopupState createState() => _FarmMarkerPopupState();
}

class _FarmMarkerPopupState extends State<FarmMarkerPopup> {
  ButtonState bs1 = ButtonState.idle;
  ButtonState bs2 = ButtonState.idle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(FarmEntity.typeNames[widget.farmentity.type],
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Image(
                  image: AssetImage("${widget.farmentity.imagePath}"),
                ),
                Text(widget.farmentity.name,
                    style:
                    TextStyle(fontStyle: FontStyle.italic, fontSize: 24)),
                Text(widget.farmentity.description),
                SizedBox(height: 5),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProgressButton.icon(
                          iconedButtons: {
                            ButtonState.idle: IconedButton(
                                text: "Direct",
                                icon: Icon(Icons.chat, color: Colors.white),
                                color: Colors.purple),
                            ButtonState.loading: IconedButton(
                                text: "Loading", color: Colors.amber),
                            ButtonState.fail: failedPB,
                            ButtonState.success: successPB
                          },
                          onPressed: () async {
                            setState(() {
                              bs1 = ButtonState.loading;
                            });
                            showMessage(context, "Sorry, we currently do not support this feature");
                            // await confirmApplyJoin(
                            //     context, widget.farmentity, 0);
                          },
                          state: bs1,
                          maxWidth: 120.0,
                          height: 40.0),
                      ProgressButton.icon(
                          iconedButtons: {
                            ButtonState.idle: IconedButton(
                                text: "Donate here",
                                icon: Icon(Icons.transit_enterexit,
                                    color: Colors.white),
                                color: Colors.orange),
                            ButtonState.loading: IconedButton(
                                text: "Loading", color: Colors.amber),
                            ButtonState.fail: failedPB,
                            ButtonState.success: successPB
                          },
                          onPressed: () async {
                            setState(() {
                              bs2 = ButtonState.loading;
                            });
                            showMessage(context, "Sorry, we currently do not support this feature");
                            // await confirmApplyJoin(
                            //     context, widget.farmentity, 1);
                          },
                          state: bs2,
                          maxWidth: 120.0,
                          height: 40.0),
                    ]),
              ],
            ),
          )),
    );
  }
  Future<void> showMessage(BuildContext context, String message,
      {String title = "Error"}) async {
    if (title == "Error") {
      await errorDialog(
        context: context,
        title: title,
        description: message,
        okOnPress: () {},
      ).show();
    } else if (title == "Success") {
      await successDialog(
          context: context,
          title: title,
          description: message,
          okOnPress: () {})
          .show();
    } else {
      await infoDialog(
          context: context,
          title: title,
          description: message,
          okOnPress: () {})
          .show();
    }
    // final myalert =
    //     AlertDialog(title: Text(title), content: Text(message), actions: [
    //   TextButton(
    //     child: Text("Ok"),
    //     onPressed: () {
    //       Navigator.of(context).pop();
    //     },
    //   )
    // ]);
    // await showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return myalert;
    //     });
    // return;
  }
}