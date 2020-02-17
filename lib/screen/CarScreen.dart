import 'package:apprental/model/CarsModel.dart';
import 'package:apprental/services/CarsServices.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    return Container();
  }
}
