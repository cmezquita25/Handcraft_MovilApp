// To parse this JSON data, do
//
//     final artesanos = artesanosFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Artesanos> artesanosFromJson(String str) => List<Artesanos>.from(json.decode(str).map((x) => Artesanos.fromJson(x)));

String artesanosToJson(List<Artesanos> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Artesanos {
    Artesanos({
        required this.idArtesanos,
        required this.nombreArtesano,
        required this.municipioLocalidad,
        required this.tallerNegocio,
        required this.logotipoNegocio,
        required this.redesSociales,
        required this.ubicacion,
        required this.geoUbicacion,
    });

    final int idArtesanos;
    final String nombreArtesano;
    final String municipioLocalidad;
    final String tallerNegocio;
    final String logotipoNegocio;
    final String redesSociales;
    final String ubicacion;
    final String geoUbicacion;

    factory Artesanos.fromJson(Map<String, dynamic> json) => Artesanos(
        idArtesanos: json["idArtesanos"],
        nombreArtesano: json["nombreArtesano"],
        municipioLocalidad: json["municipioLocalidad"],
        tallerNegocio: json["tallerNegocio"],
        logotipoNegocio: json["logotipoNegocio"],
        redesSociales: json["redesSociales"],
        ubicacion: json["ubicacion"],
        geoUbicacion: json["geoUbicacion"],
    );

    Map<String, dynamic> toJson() => {
        "idArtesanos": idArtesanos,
        "nombreArtesano": nombreArtesano,
        "municipioLocalidad": municipioLocalidad,
        "tallerNegocio": tallerNegocio,
        "logotipoNegocio": logotipoNegocio,
        "redesSociales": redesSociales,
        "ubicacion": ubicacion,
        "geoUbicacion": geoUbicacion,
    };
}
