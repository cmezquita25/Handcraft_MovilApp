import 'package:flutter/material.dart';
import 'package:hc_movil_app/Pages/Recorridos_tours.dart';
import 'package:hc_movil_app/providers/Artesanos_Provider.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class Pin_pois_Page extends StatelessWidget {

  const Pin_pois_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final artesanosProvider = Provider.of<ArtesanosProvider>(context);
    final artesanos = artesanosProvider.displayArtesanos;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Center(
            child: Text('Puntos de interes turisticos'.toUpperCase(),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
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
        padding: const EdgeInsets.only(top: 15),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: List.generate(
            artesanos.length,
            (index) => ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(artesanos[index].nombreArtesano,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                        ),
                      ),
                      subtitle: Text(artesanos[index].municipioLocalidad,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontSize: 18
                        ),
                      ),
                      leading: const Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: Icon(Icons.tour_sharp, color: Color.fromARGB(255, 80, 141, 163)),
                      ),
                    ),
                  )
                .toList()
        ),
      ),
    );
  }
}


          // DropdownButton<String>(
          //   value: actual,
          //   items: const [
          //     DropdownMenuItem(
          //       child: Text('Pois'),
          //       value: 'Pois',
          //     ),
          //     DropdownMenuItem(
          //       child: Text('Gastronomicos'),
          //       value: 'Gastronomicos',
          //     ),
          //   ],
          //   onChanged: (valor) {
          //     setState(() {
          //       texto = valor!;
          //       actual = valor;
          //     });
          //   },

          //   // onPressed: () {
          //   //   Navigator.push(
          //   //     context,
          //   //     MaterialPageRoute(
          //   //       builder: (context) => const RecorridosTours(),
          //   //     ),
          //   //   );
          // ),
