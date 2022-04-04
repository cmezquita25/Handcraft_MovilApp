import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hc_movil_app/models/estrellas.dart';
import 'package:hc_movil_app/providers/Artesanos_Provider.dart';
import 'package:provider/provider.dart';
import 'package:shaky_animated_listview/scroll_animator.dart';
import 'package:animations/animations.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:expandable/expandable.dart';

class PopularPage extends StatefulWidget {
  @override
  _PopularPageState createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage> {

List<Estrella> data = [
  Estrella(4.5),
  Estrella(4),
  Estrella(4),
  Estrella(4.5),
  Estrella(4.5),
  Estrella(5),
  Estrella(4),
  Estrella(4.5),
  Estrella(5),
  Estrella(5),
  Estrella(5),
  Estrella(4.5),
  Estrella(3.5),
  Estrella(5),
  Estrella(4.5),
  Estrella(4),
  Estrella(4),
  Estrella(4),
  Estrella(5),
  Estrella(4.5),

];

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
                'Los mas populares'.toUpperCase(),
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
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: List.generate(
          artesanos.length,
          (index) => Card(
            color: Color.fromARGB(255, 94, 122, 189),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                      artesanos[index].nombreArtesano,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    artesanos[index].municipioLocalidad,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image(
                    image: NetworkImage(artesanos[index].logotipoNegocio),
                  ),
                ),
                ExpandablePanel(
                  theme: const ExpandableThemeData(
                    iconPadding: EdgeInsets.only(right: 196, top: 2),
                    expandIcon: Icons.arrow_downward_sharp,
                    collapseIcon: Icons.arrow_upward_sharp
                    ),
                  header: 
                  const Padding(padding: EdgeInsets.only( left: 10,),
                  child: Text(
                    'Informacion adicional',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,

                    ),
                  ),
                  ),
                  collapsed: Text(''),
                  expanded:
                  Padding(padding: const EdgeInsets.only( left: 15, right: 15, bottom: 15),
                    child: Text(
                      artesanos[index].redesSociales,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(color: Colors.black,
                      fontSize: 18),
                    ),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: RatingBar.builder(
                        itemPadding: const EdgeInsets.only(left: 10, top: 10),
                          itemCount: 5,
                          allowHalfRating: true,
                          initialRating: data[index].cantidad,
                          itemSize: 26,
                          itemBuilder: (context, _) {
                            return const Icon(Icons.star_purple500_outlined, color: Colors.amber,);
                          },
                          onRatingUpdate: (raiting) {
                            print(raiting);
                          }
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, bottom: 20),
                      child: Center(
                        child: Text('Estrellas '+ data[index].cantidad.toString(),
                        style: TextStyle( color: Colors.amber, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
