import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hc_movil_app/models/artesanos.dart';
import 'package:hc_movil_app/models/tours.dart';
import 'package:http/retry.dart';
import 'package:http/http.dart' as http;

class ToursProvider extends ChangeNotifier {
  final String _host = 'handcraftapi.somee.com';
  // final Map<String, dynamic> _parameters = {'key' : ''};
  List<Tours> displayArtesanos = [];
  ToursProvider() {
    getTours();
  }

  getTours() async {
    const endpoint = '/api/Tour/Todos_los_datos';
    final url = Uri.http(_host, endpoint);
    final client = RetryClient(http.Client());

    try {
      final response = await client.read(url);
      displayArtesanos = List<Tours>.from(json.decode(response).map((x) => Tours.fromJson(x)));
      notifyListeners();
    } finally {
      client.close();
    }
  }
}
