import 'package:flutter/material.dart';
import 'package:hc_movil_app/Pages/Solicitar_tours.dart';
import 'package:hc_movil_app/providers/Artesanos_Provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  int _selectedIndex = 0;

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
              'Bienvenidos a HandCraft Route'.toUpperCase(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 236, 240, 241),
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 236, 240, 241),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                height: MediaQuery.of(context).size.height - 450,
                child: PageView.builder(
                    itemCount: artesanos.length,
                    controller: PageController(viewportFraction: 0.9),
                    onPageChanged: (int index) =>
                        setState(() => _index = index),
                    itemBuilder: (context, i) {
                      return Transform.scale(
                        scale: i == _index ? 1.0 : 0.9,
                        child: GestureDetector(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height - 568,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          artesanos[i].logotipoNegocio),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: const Offset(2, 3),
                                      )
                                    ]),
                              ),
                              Text(
                                artesanos[i].nombreArtesano,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Text(
              'Sobre nosotros'.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Column(
              children: [
                Card(
                  color: const Color.fromARGB(255, 236, 240, 241),
                  // Con esta propiedad modificamos la forma de nuestro card
                  // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  // Con esta propiedad agregamos margen a nuestro Card
                  // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 10),
                  // Con esta propiedad agregamos elevación a nuestro card
                  // La sombra que tiene el Card aumentará
                  elevation: 0,
                  // La propiedad child anida un widget en su interior
                  // Usamos columna para ordenar un ListTile y una fila con botones
                  child: Column(
                    children: const <Widget>[
                      // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
                      ListTile(
                        contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                        title: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text('MEJORES DESTINOS',
                          style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        subtitle: Text('Viaje al rededor del mundo con nuestros paquetes, y disfrute de unas vacaciones inolvidables.',
                        style: TextStyle(color: Colors.black),),
                        leading: Padding(
                          padding: EdgeInsets.only(right: 2),
                          child: Icon(Icons.public_sharp, color: Colors.brown, size: 40,),
                        ),
                      ),
                      // Usamos una fila para ordenar los botones del card 
                    ],
                  ),
                ),
                Card(
                  color: const Color.fromARGB(255, 236, 240, 241),
                  // Con esta propiedad modificamos la forma de nuestro card
                  // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  // Con esta propiedad agregamos margen a nuestro Card
                  // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 10),
                  // Con esta propiedad agregamos elevación a nuestro card
                  // La sombra que tiene el Card aumentará
                  elevation: 0,
                  // La propiedad child anida un widget en su interior
                  // Usamos columna para ordenar un ListTile y una fila con botones
                  child: Column(
                    children: const <Widget>[
                      // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
                      ListTile(
                        contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                        title: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text('ASESOR PERSONAL',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle: Text('Lo conectamos con el asesor adecuado que creará su experiencia de viaje ideal.',
                        style: TextStyle(color: Colors.black),
                        ),
                        leading: Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: Icon(Icons.person_outline, color: Colors.red, size: 40,),
                        ),
                      ),
                      // Usamos una fila para ordenar los botones del card 
                    ],
                  ),
                ),
                Card(
                  color: const Color.fromARGB(255, 236, 240, 241),
                  // Con esta propiedad modificamos la forma de nuestro card
                  // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  // Con esta propiedad agregamos margen a nuestro Card
                  // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 10),
                  // Con esta propiedad agregamos elevación a nuestro card
                  // La sombra que tiene el Card aumentará
                  elevation: 0,
                  // La propiedad child anida un widget en su interior
                  // Usamos columna para ordenar un ListTile y una fila con botones
                  child: Column(
                    children: const <Widget>[
                      // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
                      ListTile(
                        contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                        title: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text('MEJORES PRECIOS',
                          style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        subtitle: Text('Somos su mejor alternativa en precio justo, reserve con nosotros descubra lo que se ahorra.',
                        style: TextStyle(color: Colors.black),),
                        leading: Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: Icon(Icons.attach_money_sharp, color: Colors.green, size: 40,),
                        ),
                      ),
                      // Usamos una fila para ordenar los botones del card 
                    ],
                  ),
                ),
                Card(
                  color: const Color.fromARGB(255, 236, 240, 241),
                  // Con esta propiedad modificamos la forma de nuestro card
                  // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  // Con esta propiedad agregamos margen a nuestro Card
                  // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 10),
                  // Con esta propiedad agregamos elevación a nuestro card
                  // La sombra que tiene el Card aumentará
                  elevation: 0,
                  // La propiedad child anida un widget en su interior
                  // Usamos columna para ordenar un ListTile y una fila con botones
                  child: Column(
                    children: const <Widget>[
                      // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
                      ListTile(
                        contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                        title: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text('VIAJA SEGURO',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle: Text('Usted puede estar tranquilo, ya que nuestro equipo de asistencia le asesorará antes, durante y después de su viaje.',
                        style: TextStyle(color: Colors.black),
                        ),
                        leading: Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: Icon(Icons.security_sharp, color: Colors.black, size: 40,),
                        ),
                      ),
                      // Usamos una fila para ordenar los botones del card 
                    ],
                  ),
                ),
                Card(
                  color: const Color.fromARGB(255, 236, 240, 241),
                  // Con esta propiedad modificamos la forma de nuestro card
                  // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  // Con esta propiedad agregamos margen a nuestro Card
                  // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 10),
                  // Con esta propiedad agregamos elevación a nuestro card
                  // La sombra que tiene el Card aumentará
                  elevation: 0,
                  // La propiedad child anida un widget en su interior
                  // Usamos columna para ordenar un ListTile y una fila con botones
                  child: Column(
                    children: const <Widget>[
                      // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
                      ListTile(
                        contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                        title: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text('CALIDAD',
                          style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        subtitle: Text('Contamos con 40 años de experiencia ofreciendo paquetes de alta calidad para nuestros clientes.',
                        style: TextStyle(color: Colors.black),),
                        leading: Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: Icon(Icons.star_sharp, color: Colors.amber, size: 40,),
                        ),
                      ),
                      // Usamos una fila para ordenar los botones del card 
                    ],
                  ),
                ),
                Card(
                  color: const Color.fromARGB(255, 236, 240, 241),
                  // Con esta propiedad modificamos la forma de nuestro card
                  // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  // Con esta propiedad agregamos margen a nuestro Card
                  // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 10),
                  // Con esta propiedad agregamos elevación a nuestro card
                  // La sombra que tiene el Card aumentará
                  elevation: 0,
                  // La propiedad child anida un widget en su interior
                  // Usamos columna para ordenar un ListTile y una fila con botones
                  child: Column(
                    children: const <Widget>[
                      // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
                      ListTile(
                        contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                        title: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text('VIAJE GUIADO',
                          style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(bottom: 40),
                          child: Text('Más que un agente de viajes, su asesor es un compañero de viaje con una pasión para ayudarlo a ver el mundo.',
                        style: TextStyle(color: Colors.black),),
                        ),
                        leading: Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: Icon(Icons.map_sharp, color: Color.fromARGB(255, 94, 122, 189), size: 40,),
                        ),
                      ),
                      // Usamos una fila para ordenar los botones del card 
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
