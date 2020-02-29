import 'package:apprental/model/CarsModel.dart';
import 'package:apprental/screen/DetailMapScreen.dart';
import 'package:apprental/services/CarsServices.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class CarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Cars>>(
        future: fetchCars(http.Client()),
        builder: (context, snap) {
          if (snap.hasError) {
            print(snap.error);
          }
          return snap.hasData
              ? CarsList(cars: snap.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class CarsList extends StatelessWidget {
  final List<Cars> cars;

  CarsList({Key key, @required this.cars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: fetchTransaction(http.Client()),
        builder: (context, snap) {
          if (snap.hasError) {
            print(snap.error);
          }
          return snap.hasData
              ? ListView.builder(
                  itemCount: snap.data.length,
                  itemBuilder: (context, index) {
                    return _buildContainerListTransaction(
                        snap.data, index, context);
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  _launchURL() async {
    dynamic phone = "+628114111778";
    var whatsappUrl =
        "https://wa.me/$phone?text=Assalamualaikum, Saya Akan Melakukan Transaksi";
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  Widget _buildContainerListTransaction(items, index, context) {
    return new InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new IconButton(
                    icon: new Icon(Icons.message),
                    tooltip: 'Call Owner',
                    onPressed: _launchURL,
                  ),
                  new IconButton(
                    icon: new Icon(Icons.map),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailMapScreen(
                            transaction: items[index],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
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
      },
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(5),
        decoration: new BoxDecoration(
          color: Color.fromRGBO(64, 75, 96, .9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: new Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    width: 40,
                    height: 40,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage('assets/images/icon.png'),
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  new SizedBox(
                    width: 10,
                  ),
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        'History Pemesanan',
                        style: GoogleFonts.raleway(
                          textStyle: new TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      new Row(
                        children: <Widget>[
                          new Text(
                            '${items[index].jenis} - ${items[index].createdat}',
                            style: GoogleFonts.raleway(
                              textStyle: new TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
