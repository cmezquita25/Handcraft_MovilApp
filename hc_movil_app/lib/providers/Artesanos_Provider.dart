import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hc_movil_app/models/artesanos.dart';
import 'package:http/retry.dart';
import 'package:http/http.dart' as http;

class ArtesanosProvider extends ChangeNotifier {
  final String _host = 'handcraftapi.somee.com';
  // final Map<String, dynamic> _parameters = {'key' : ''};
  List<Artesanos> displayArtesanos = [];
  ArtesanosProvider() {
    getArtesanos();
  }

  getArtesanos() async {
    const endpoint = '/api/Arte/Todos_los_datos';
    final url = Uri.http(_host, endpoint);
    final client = RetryClient(http.Client());

    try {
      final response = await client.read(url);
      displayArtesanos = List<Artesanos>.from(json.decode(response).map((x) => Artesanos.fromJson(x)));
      notifyListeners();
    } finally {
      client.close();
    }
  }
}
