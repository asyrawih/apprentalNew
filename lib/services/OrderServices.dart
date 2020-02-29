// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
// import 'package:apprental/model/OrderModel.dart';

// List<Order> parseOrder(String respon) {
//   final parse = json.decode(respon).cast<Map<String, dynamic>>();
//   return parse.map<Order>((json) => Order.fromJson(json)).toList();
// }

// Future<List<Order>> fetchOrder(http.Client client) async {
//   final response = await client.get('https://irent.id/api/v1/transaksi');
//   return compute(parseOrder, response.body);
// }


