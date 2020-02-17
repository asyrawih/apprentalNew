import 'package:apprental/_widgets/_ListCard.dart';
import 'package:apprental/model/CarsModel.dart';
import 'package:apprental/services/CarsServices.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
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
              ? ListView.builder(
                  itemCount: snap.data.length,
                  itemBuilder: (context, index) {
                    return ListCard(cars: snap.data, urut: index);
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
