import 'package:flutter/material.dart';
import 'package:hc_movil_app/Pages/Recorridos_pin.dart';
import 'package:hc_movil_app/providers/ArtesanosCooperativa_Provider.dart';
import 'package:hc_movil_app/providers/Artesanos_Provider.dart';
import 'package:provider/provider.dart';

class Gastronomicos extends StatelessWidget {
const Gastronomicos({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    final artesanosProvider = Provider.of<ArtesanosCooperativaProvider>(context);
    final artesanos = artesanosProvider.displayArtesanosCooperativa;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 25,),
          child: Center(
            child: Text('Puntos de interes '.toUpperCase()+
            'Gastronomicos'.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 17
                ),
              ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 236, 240, 241),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0, 
      ),
      backgroundColor: const Color.fromARGB(255, 236, 240, 241),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: List.generate(
            artesanos.length,
            (index) => ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(artesanos[index].nombreComercio,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                        ),
                      ),
                      subtitle: Text(artesanos[index].telefono,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontSize: 18
                        ),
                      ),
                      leading: const Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: Icon(Icons.tour_sharp, color: Color.fromARGB(255, 91, 127, 167)),
                      ),
                    ),
                  )
                .toList()
        ),
      ),
    );
  }
}