import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hc_movil_app/models/artesanos.dart';
import 'package:hc_movil_app/models/artesanosCooperativa.dart';
import 'package:http/retry.dart';
import 'package:http/http.dart' as http;

class ArtesanosCooperativaProvider extends ChangeNotifier {
  final String _host = 'handcraftapi.somee.com';
  // final Map<String, dynamic> _parameters = {'key' : ''};
  List<ArtesanosCooperativa> displayArtesanosCooperativa = [];
  ArtesanosCooperativaProvider() {
    getArtesanosCooperativa();
  }

  getArtesanosCooperativa() async {
    const endpoint = '/ArteCoop/Todos_los_datos';
    final url = Uri.http(_host, endpoint);
    final client = RetryClient(http.Client());

    try {
      final response = await client.read(url);
      displayArtesanosCooperativa = List<ArtesanosCooperativa>.from(json.decode(response).map((x) => ArtesanosCooperativa.fromJson(x)));
      notifyListeners();
    } finally {
      client.close();
    }
  }
}
