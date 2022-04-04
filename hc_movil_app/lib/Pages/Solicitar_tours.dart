import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:hc_movil_app/Screens/BNB_Navigation.dart';
import 'package:hc_movil_app/models/tours.dart';
import 'package:http/http.dart' as http;


Future<Tours> createTour( 
    String nombrePersona,
    String correoPersona,
    String telefonoPersona,
    String nombreTour) async {
  final response = await http.post(
    Uri.parse('http://handcraftapi.somee.com/api/Tour'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
        "nombrePersona": nombrePersona,
        "correoPersona": correoPersona,
        "telefonoPersona": telefonoPersona,
        "nombreTour": nombreTour,
    }),
  );

  if (response.statusCode == 201) {
    return Tours.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Se creo la Solicitud.');
  }
}

class SolicitarTours extends StatefulWidget {

  @override
  _SolicitarToursState createState() => _SolicitarToursState();
}

// ignore: camel_case_types
class _SolicitarToursState extends State<SolicitarTours> {
  TextEditingController nombre = TextEditingController();
  TextEditingController correo = TextEditingController();
  TextEditingController telefono = TextEditingController();
  TextEditingController nombreTour = TextEditingController();

  Future<Tours>? crear;

  List tours = [
    'Calcehtok',
    'Loltún',
    'Balankanché',
    'Zací',
    "X'Kekén",
    'Uxmal',
    'Sayil',
    'Mayapán',
    'Dzoyaxché',
    'San Antonio Chichí de los Lagos',
    'Athziri',
    'Ek Balam',
    'Valladolid',
    'Uxmal',
    'Mayapán',
    'Tinum',
    'Acanceh',
    'Lepan',
    'Petac',
    'Abalá'
  ];

  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(20.400417, -89.134857),
  //   zoom: 14.4746,
  // );
  final formkey_yes = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Regresar', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.8),
        child: Form(
          key: formkey_yes,
          child: Column(
            children: <Widget>[
              Flexible(
                child: TextFormField(
                  controller: nombre,
                  validator: (String? value){
                    if (value != null && value.isEmpty){
                      return 'Rellena este campo';
                    }
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person_rounded,
                    color: Colors.black,),
                    hintText: 'Nombre completo del solicitante',
                    labelText: 'Nombre completo del solicitante',
                  ),
                  
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              Flexible(
                child: TextFormField(
                  controller: correo,
                  validator: (String? value){
                    if (value != null && value.isEmpty){
                      return 'Rellena este campo';
                    }
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email_rounded,
                    color: Colors.black,),
                    hintText: 'Correo electronico',
                    labelText: 'Correo electronico',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              Flexible(
                child: TextFormField(
                  controller: telefono,
                  validator: (String? value){
                    if (value != null && value.isEmpty){
                      return 'Rellena este campo';
                    }
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.phone_rounded,
                    color: Colors.black,),
                    hintText: 'Telefono',
                    labelText: 'Telefono',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              Flexible(
                child: TextFormField(
                  controller: nombreTour,
                  validator: (String? value){
                    if (value != null && value.isEmpty){
                      return 'Rellena este campo';
                    }
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.tour_rounded,
                    color: Colors.black,),
                    hintText: 'Seleccione un tour',
                    labelText: 'Seleccione un tour',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              // Column(children: [
              //   SizedBox(
              //       width: 500, // or use fixed size like 200
              //       height: 250,
              //       child: GoogleMap(
              //         mapType: MapType.normal,
              //         initialCameraPosition: _kGooglePlex,
              //         myLocationEnabled: true,
              //         myLocationButtonEnabled: true,
              //       ))
              // ]),
              Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                width: 185,
                height: 40,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 67, 80, 108),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: FlatButton(
                  child: const Text(
                    "Solicitar Tour",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                  if (formkey_yes.currentState!.validate()) {
                  crear = createTour(nombre.text, 
                    correo.text, 
                    telefono.text, 
                    nombreTour.text);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BNB_Navigation(),
                      ),
                    );
                  }
                },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
