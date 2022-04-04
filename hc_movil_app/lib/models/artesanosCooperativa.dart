// To parse this JSON data, do
//
//     final artesanosCooperativa = artesanosCooperativaFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ArtesanosCooperativa> artesanosCooperativaFromJson(String str) => List<ArtesanosCooperativa>.from(json.decode(str).map((x) => ArtesanosCooperativa.fromJson(x)));

String artesanosCooperativaToJson(List<ArtesanosCooperativa> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArtesanosCooperativa {
    ArtesanosCooperativa({
        required this.idCooperativa,
        required this.nombreComercio,
        required this.telefono,
        required this.descripcion,
        required this.platillo1,
        required this.platillo2,
        required this.platillo3,
        required this.ubicacion,
        required this.geoUbicacion,
    });

    final int idCooperativa;
    final String nombreComercio;
    final String telefono;
    final String descripcion;
    final String platillo1;
    final String platillo2;
    final String platillo3;
    final String ubicacion;
    final String geoUbicacion;

    factory ArtesanosCooperativa.fromJson(Map<String, dynamic> json) => ArtesanosCooperativa(
        idCooperativa: json["idCooperativa"],
        nombreComercio: json["nombreComercio"],
        telefono: json["telefono"],
        descripcion: json["descripcion"],
        platillo1: json["platillo1"],
        platillo2: json["platillo2"],
        platillo3: json["platillo3"],
        ubicacion: json["ubicacion"],
        geoUbicacion: json["geoUbicacion"],
    );

    Map<String, dynamic> toJson() => {
        "idCooperativa": idCooperativa,
        "nombreComercio": nombreComercio,
        "telefono": telefono,
        "descripcion": descripcion,
        "platillo1": platillo1,
        "platillo2": platillo2,
        "platillo3": platillo3,
        "ubicacion": ubicacion,
        "geoUbicacion": geoUbicacion,
    };
}
