import 'dart:convert';
import 'package:apprental/model/CarsModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

// Fungsi Parsing Ke list Dari Json API
List<Cars> parseCars(String responsesBody) {
  final parsed = json.decode(responsesBody).cast<Map<String, dynamic>>();
  return parsed.map<Cars>((json) => Cars.fromJson(json)).toList();
}

Future<List<Cars>> fetchCars(http.Client client) async {
  final response = await client.get('https://irent.id/api/v1/cars/owners');
  return compute(parseCars, response.body);
}
