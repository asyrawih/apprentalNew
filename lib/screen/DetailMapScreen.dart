import 'package:apprental/model/CarsModel.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailMapScreen extends StatefulWidget {
  final dynamic transaction;
  final Cars cars;
  DetailMapScreen({this.cars, this.transaction});
  @override
  _DetailMapScreenState createState() => _DetailMapScreenState();
}

class _DetailMapScreenState extends State<DetailMapScreen> {
  static dynamic long, lat;
  List<Marker> allMarkers = [];
  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(lat, long),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(-5.1326326, 119.4463043),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  @override
  void initState() {
    super.initState();
    long = widget.transaction.longitude;
    lat = widget.transaction.latitude;
    print('Marke Tape');
    allMarkers.add(
      new Marker(
        markerId: new MarkerId('myMarker'),
        draggable: false,
        position: new LatLng(
          widget.transaction.latitude,
          widget.transaction.longitude,
        ),
      ),
    );
  }

  ProgressDialog pr;

  @override
  Widget build(BuildContext context) {
    print(widget.transaction.latitude);
    pr = new ProgressDialog(context, type: ProgressDialogType.Normal);

    pr.style(message: 'Showing some progress...');

    //Optional
    pr.style(
      message: 'Silahkan Tunggu',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      progressWidget: CircularProgressIndicator(),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    );
    return Scaffold(
      appBar: new AppBar(
        elevation: 0,
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set.from(allMarkers),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        onPressed: () async {
          String googleUrl =
              'https://www.google.com/maps/search/?api=1&query=${widget.transaction.latitude},${widget.transaction.longitude}';
          if (await canLaunch(googleUrl)) {
            await launch(googleUrl);
          } else {
            throw 'Could not open the map.';
          }
        },
        label: Text('Direction!'),
        icon: Icon(Icons.directions),
      ),
    );
  }
}
