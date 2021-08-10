import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/material.dart';
import 'farm_entity.dart';
import 'dart:async';
import 'default.dart';
class MapWithPopups extends StatefulWidget {
  final PopupSnap snap;
  final bool rotate;
  final bool fade;
  final AnchorAlign markerAnchorAlign;
  final List<FarmEntity>? felist;

  MapWithPopups({
    required this.felist,
    this.snap = PopupSnap.markerTop,
    this.rotate = true,
    this.fade = false,
    this.markerAnchorAlign = AnchorAlign.center,
    Key? key,
  }) : super(key: key);

  @override
  _MapWithPopupsState createState() => _MapWithPopupsState();
}

class _MapWithPopupsState extends State<MapWithPopups> {
  late List<Marker> _markers;
  late CenterOnLocationUpdate _centerOnLocationUpdate;
  late StreamController<double> _centerCurrentLocationStreamController;

  /// Used to trigger showing/hiding of popups.
  final PopupController _popupLayerController = PopupController();

  @override
  void initState() {
    super.initState();
    _centerOnLocationUpdate = CenterOnLocationUpdate.always;
    _centerCurrentLocationStreamController = StreamController<double>();
    _markers = _buildMarkers();
    // print(widget.felist);
  }

  @override
  void dispose() {
    _centerCurrentLocationStreamController.close();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant MapWithPopups oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.markerAnchorAlign != oldWidget.markerAnchorAlign) {
      final markerWithPopup = _popupLayerController.selectedMarker;

      setState(() {
        _markers = _buildMarkers();
      });

      /// When changing the Markers we should hide the old popup if the Markers
      /// might have changed in such a way that the popup should change (e.g.
      /// anchor point change). If we can match one of the new Markers to the
      /// old Marker that had the popup then we can show the popup for that
      /// Marker.
      if (markerWithPopup != null) {
        final markerWithPopupIndex = _markers
            .indexWhere((marker) => marker.point == markerWithPopup.point);

        if (markerWithPopupIndex != -1) {
          _popupLayerController.showPopupFor(
            _markers[markerWithPopupIndex],
            disableAnimation: true,
          );
        } else {
          _popupLayerController.hidePopup(disableAnimation: true);
        }
      }
    }
  }

  List<FarmMarker> _buildMarkers() {
    //  List<FarmMarker> l2 = widget.felist;
    if (widget.felist != null) {
      return widget.felist!.map((fm) => FarmMarker(farmentity: fm)).toList();
    } else
      return defaultfelist.map((fm) => FarmMarker(farmentity: fm)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
          zoom: 11.0,
          center: LatLng(1.35, 103.8),
          onTap: (_) => _popupLayerController
              .hidePopup(), // Hide popup when the map is tapped.
          onPositionChanged: (MapPosition position, bool hasGesture) {
            if (hasGesture) {
              setState(
                      () => _centerOnLocationUpdate = CenterOnLocationUpdate.never);
            }
          }),
      children: [
        TileLayerWidget(
          options: TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
        ),
        LocationMarkerLayerWidget(
          plugin: LocationMarkerPlugin(
            centerCurrentLocationStream:
            _centerCurrentLocationStreamController.stream,
            centerOnLocationUpdate: _centerOnLocationUpdate,
          ),
        ),
        PopupMarkerLayerWidget(
          options: PopupMarkerLayerOptions(
            markers: _markers,
            popupSnap: widget.snap,
            popupController: _popupLayerController,
            popupBuilder: (_, Marker marker) {
              if (marker is FarmMarker) {
                return FarmMarkerPopup(farmentity: marker.farmentity);
              }
              return Card(child: const Text('Unexpected action'));
            },
            markerRotate: widget.rotate,
            markerRotateAlignment: PopupMarkerLayerOptions.rotationAlignmentFor(
              widget.markerAnchorAlign,
            ),
            popupAnimation: widget.fade
                ? PopupAnimation.fade(duration: Duration(milliseconds: 700))
                : null,
          ),
        ),
      ],
      nonRotatedChildren: [
        // Not working as intended
        // MarkerClusterLayerWidget(
        //   options: MarkerClusterLayerOptions(
        //     disableClusteringAtZoom: 13,
        //     maxClusterRadius: 60,
        //     size: Size(40, 40),
        //     fitBoundsOptions: FitBoundsOptions(
        //       padding: EdgeInsets.all(50),
        //     ),
        //     markers: _markers,
        //     polygonOptions: PolygonOptions(
        //         borderColor: Colors.blueAccent,
        //         color: Colors.black12,
        //         borderStrokeWidth: 3),
        //     builder: (context, markers) {
        //       return FloatingActionButton(
        //         child: Text(markers.length.toString()),
        //         onPressed: null,
        //         backgroundColor: Colors.red,
        //       );
        //     },
        //   ),
        // ),
        Positioned(
          right: 20,
          bottom: 20,
          child: FloatingActionButton(
            onPressed: () {
              // Automatically center the location marker on the map when location updated until user interact with the map.
              setState(() =>
              _centerOnLocationUpdate = CenterOnLocationUpdate.always);
              // Center the location marker on the map and zoom the map to level 15.
              _centerCurrentLocationStreamController.add(15);
            },
            child: Icon(
              Icons.my_location,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}