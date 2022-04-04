// To parse this JSON data, do
//
//     final productos = productosFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Productos> productosFromJson(String str) => List<Productos>.from(json.decode(str).map((x) => Productos.fromJson(x)));

String productosToJson(List<Productos> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Productos {
    Productos({
        required this.idProductos,
        required this.nombreProducto,
        required this.telefono,
        required this.descripcion,
        required this.materialElaborado,
        required this.fotografia,
    });

    final int idProductos;
    final String nombreProducto;
    final String telefono;
    final String descripcion;
    final String materialElaborado;
    final String fotografia;

    factory Productos.fromJson(Map<String, dynamic> json) => Productos(
        idProductos: json["idProductos"],
        nombreProducto: json["nombreProducto"],
        telefono: json["telefono"],
        descripcion: json["descripcion"],
        materialElaborado: json["materialElaborado"],
        fotografia: json["fotografia"],
    );

    Map<String, dynamic> toJson() => {
        "idProductos": idProductos,
        "nombreProducto": nombreProducto,
        "telefono": telefono,
        "descripcion": descripcion,
        "materialElaborado": materialElaborado,
        "fotografia": fotografia,
    };
}
