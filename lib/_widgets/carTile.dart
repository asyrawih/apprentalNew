import 'package:apprental/model/CarsModel.dart';
import 'package:apprental/screen/Details.dart';
import 'package:flutter/material.dart';

class CarTile extends StatelessWidget {
  final String jenis;
  final String warna;
  final String tahun;
  final String gambar;
  final Cars cars;

  CarTile({this.jenis, this.warna, this.tahun, this.gambar, this.cars});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(width: 1.0, color: Colors.white24),
          ),
        ),
        child: Icon(Icons.directions_car, color: Colors.white),
      ),
      title: Text(
        jenis,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Icon(Icons.date_range, color: Colors.yellowAccent),
          Text(
            ' ' + tahun,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 10.0,
          ),
          Icon(Icons.color_lens, color: Colors.yellowAccent),
          Text(
            ' ' + warna,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
      trailing:
          Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Details(cars: cars)),
        );
      },
    );
  }
}
