import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hc_movil_app/Pages/Solicitar_tours.dart';
import 'package:hc_movil_app/providers/Artesanos_Provider.dart';
import 'package:provider/provider.dart';
import 'package:shaky_animated_listview/scroll_animator.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
  
}

class _TravelPageState extends State<TravelPage> {

  @override
  Widget build(BuildContext context) {
    final artesanosProvider = Provider.of<ArtesanosProvider>(context);
    final artesanos = artesanosProvider.displayArtesanos;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Center(
              child: Text(
                'Sitios Turisticos'.toUpperCase(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 236, 240, 241),
          elevation: 0,
      ),
        backgroundColor: const Color.fromARGB(255, 236, 240, 241),
        body: AnimatedListView(
          padding: const EdgeInsets.all(15.0),
            duration: 100,
            extendedSpaceBetween: 20,
            spaceBetween: 5,
            children: List.generate(
                artesanos.length,
                (index) => Card(
                  color: const Color.fromARGB(255, 165, 222, 241),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(artesanos[index].nombreArtesano,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                      ),
                      subtitle: Text(
                        artesanos[index].municipioLocalidad,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6)
                          ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only( left: 10, right: 10),
                      child: Image(
                        image: NetworkImage( artesanos[index].logotipoNegocio),
                      ),
                    ),
                    Column(
                      children: [
                        ListTile(
                        title: Text(artesanos[index].tallerNegocio,
                        textAlign: TextAlign.left,
                        ),
                        subtitle: Text(
                        artesanos[index].ubicacion,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black
                          ),
                      ),
                        ),
                      ],
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
                    const Divider(),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                          textColor:Color.fromARGB(255, 67, 80, 108),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SolicitarTours(),
                              ),
                            );
                          },
                          child: const Text('Solicitar Tour',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight:  FontWeight.bold,
                          )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ),
    );
  }
}
