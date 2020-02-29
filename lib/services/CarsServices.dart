import 'dart:convert';
import 'package:apprental/model/CarsModel.dart';
import 'package:apprental/model/TransactionModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:apprental/services/sign_in.dart';

// Fungsi Parsing Ke list Dari Json API
List<Cars> parseCars(String responsesBody) {
  final parsed = json.decode(responsesBody).cast<Map<String, dynamic>>();
  return parsed.map<Cars>((json) => Cars.fromJson(json)).toList();
}

List<Transaction> parseTransaction(String responsesBody) {
  final parsed = json.decode(responsesBody).cast<Map<String, dynamic>>();
  return parsed.map<Transaction>((json) => Transaction.fromJson(json)).toList();
}

Future<List<Cars>> fetchCars(http.Client client) async {
  final response = await client.get('https://irent.id/api/v1/cars/owners');
  return compute(parseCars, response.body);
}

Future<List<Transaction>> fetchTransaction(http.Client client) async {
  print('uid dari user ${uid.toString()}');
  final response = await client.get('https://irent.id/api/v1/transaksi');
  return compute(parseTransaction, response.body);
}

Future<TransactionPost> createPost(String url, {Map body}) async {
  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return TransactionPost.fromJson(json.decode(response.body));
  });
}
