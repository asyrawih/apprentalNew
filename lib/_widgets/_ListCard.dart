import 'package:apprental/_widgets/carTile.dart';
import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final List<dynamic> cars;
  final int urut;
  ListCard({@required this.cars, this.urut});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: CarTile(
          jenis: cars[urut].jenis,
          warna: cars[urut].warna,
          tahun: cars[urut].modelTahun,
          gambar: cars[urut].gambar,
          cars: cars[urut],
        ),
      ),
    );
  }
}
