import 'package:apprental/model/CarsModel.dart';
import 'package:apprental/screen/TransactionScreen.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final Cars cars;
  Details({this.cars});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      backgroundColor: Colors.greenAccent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://irent.id/uploads/thumb/cars/" + cars.gambar,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: DraggableScrollableSheet(
          initialChildSize: 0.3,
          minChildSize: 0.2,
          maxChildSize: 0.5,
          expand: true,
          builder: (BuildContext context, ScrollController controller) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                // color: Color.fromRGBO(58, 66, 86, 1.0),
                color: Colors.greenAccent
              ),
              child: ListView(
                controller: controller,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 150, right: 150),
                    height: 8,
                    width: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  new InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => new TransactionScreen(
                            cars: cars,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 150, right: 150),
                      height: 50,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(58, 66, 87, 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 20,
                                offset: Offset(2, 0))
                          ]),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 3.0,
                            ),
                            Icon(
                              Icons.shopping_basket,
                              color: Colors.white,
                            ),
                            Text(
                              "Pesan",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  ListCarsTile(
                    icon: Icons.directions_car,
                    content: cars.jenis.toUpperCase(),
                    trail: "JNS",
                  ),
                  ListCarsTile(
                    icon: Icons.date_range,
                    content: cars.modelTahun,
                    trail: "THN",
                  ),
                  ListCarsTile(
                    icon: Icons.control_point_duplicate,
                    content: cars.platPolisi.toUpperCase(),
                    trail: "PLT",
                  ),
                  ListCarsTile(
                    icon: Icons.directions_car,
                    content: cars.noChasis.toUpperCase(),
                    trail: "NCHS",
                  ),
                  ListCarsTile(
                    icon: Icons.storage,
                    content: cars.kapasitas.toUpperCase(),
                    trail: "KPST",
                  ),
                  ListCarsTile(
                    icon: Icons.colorize,
                    content: cars.warna.toUpperCase(),
                    trail: "WRN",
                  ),
                  ListCarsTile(
                    icon: Icons.person,
                    content: cars.owner.namaDepan.toUpperCase(),
                    trail: "OWNR",
                  ),
                  ListCarsTile(
                    icon: Icons.phone_android,
                    content: cars.owner.noHp.toUpperCase(),
                    trail: "NOHP",
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ListCarsTile extends StatelessWidget {
  final IconData icon;
  final String content;
  final String trail;
  const ListCarsTile({this.icon, this.content, this.trail});
  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Color.fromRGBO(58, 66, 86, 1.0),
      color: Colors.greenAccent,
      elevation: 10,
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(
          content,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
        trailing: Text(
          trail,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
