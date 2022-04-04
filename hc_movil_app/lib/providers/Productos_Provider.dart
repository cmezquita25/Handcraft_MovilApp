import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hc_movil_app/models/artesanos.dart';
import 'package:hc_movil_app/models/productos.dart';
import 'package:http/retry.dart';
import 'package:http/http.dart' as http;

class ProductosProvider extends ChangeNotifier {
  final String _host = 'handcraftapi.somee.com';
  // final Map<String, dynamic> _parameters = {'key' : ''};
  List<Productos> displayProductosProvider = [];
  ProductosProvider() {
    getProductos();
  }

  getProductos() async {
    const endpoint = '/api/ArtesanoProduct/Todos_los_datos';
    final url = Uri.http(_host, endpoint);
    final client = RetryClient(http.Client());

    try {
      final response = await client.read(url);
      displayProductosProvider = List<Productos>.from(json.decode(response).map((x) => Productos.fromJson(x)));
      notifyListeners();
    } finally {
      client.close();
    }
  }
}
