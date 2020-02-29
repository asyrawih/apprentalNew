import 'package:apprental/model/CarsModel.dart';
import 'package:apprental/model/TransactionModel.dart';
import 'package:apprental/services/CarsServices.dart';
import 'package:apprental/services/sign_in.dart';
import 'package:apprental/ui/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:progress_dialog/progress_dialog.dart';

class TransactionScreen extends StatefulWidget {
  final Cars cars; 
  TransactionScreen({this.cars});
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  dynamic long, lat;
  
  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-5.1326326, 119.4463043),
    zoom: 14.4746,
  );

  // static final CameraPosition _kLake = CameraPosition(
  //   bearing: 192.8334901395799,
  //   target: LatLng(-5.1326326, 119.4463043),
  //   tilt: 59.440717697143555,
  //   zoom: 19.151926040649414,
  // );

  ProgressDialog pr;

  @override
  Widget build(BuildContext context) {
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
        title: new Text(
          widget.cars.jenis,
          style: GoogleFonts.raleway(),
        ),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: _markers,
        onTap: (position) {
          setState(() {
            _markers.clear();
            lat = position.latitude;
            long = position.longitude;
            _markers.add(
              Marker(
                markerId:
                    MarkerId("${position.latitude}, ${position.longitude}"),
                icon: BitmapDescriptor.defaultMarker,
                position: position,
              ),
            );
          });
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        onPressed: () async {
          if (lat == null || long == null) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: new Text("Tandai Terlebih Dahulu Lokasi Antar"),
                  actions: <Widget>[
                    new FlatButton(
                      child: new Text("Tutup"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          } else {
            print(lat);
            print(long);
            TransactionPost newTransaction = new TransactionPost(
                uuid: uid,
                jenis: widget.cars.jenis,
                latitude: lat.toString(),
                longitude: long.toString());
            TransactionPost p = await createPost(
                "https://irent.id/api/v1/transaksi",
                body: newTransaction.toMap());
            print(p);
            pr.show();
            Future.delayed(
              Duration(
                seconds: 1,
              ),
            ).then(
              (onValue) {
                if (pr.isShowing()) {
                  pr.hide();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                }
              },
            );
          }
        },
        label: Text('Order Now!'),
        icon: Icon(Icons.shopping_basket),
      ),
    );
  }
}
