// To parse this JSON data, do
//
//     final tours = toursFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Tours> toursFromJson(String str) => List<Tours>.from(json.decode(str).map((x) => Tours.fromJson(x)));

String toursToJson(List<Tours> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tours {
    Tours({
        required this.idTours,
        required this.nombrePersona,
        required this.correoPersona,
        required this.telefonoPersona,
        required this.nombreTour,
    });

    final int idTours;
    final String nombrePersona;
    final String correoPersona;
    final String telefonoPersona;
    final String nombreTour;

    factory Tours.fromJson(Map<String, dynamic> json) => Tours(
        idTours: json["idTours"],
        nombrePersona: json["nombrePersona"],
        correoPersona: json["correoPersona"],
        telefonoPersona: json["telefonoPersona"],
        nombreTour: json["nombreTour"],
    );

    Map<String, dynamic> toJson() => {
        "idTours": idTours,
        "nombrePersona": nombrePersona,
        "correoPersona": correoPersona,
        "telefonoPersona": telefonoPersona,
        "nombreTour": nombreTour,
    };
}
