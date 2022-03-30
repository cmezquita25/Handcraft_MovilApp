import 'package:flutter/material.dart';

import 'package:shaky_animated_listview/scroll_animator.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();

}

class _TravelPageState extends State<TravelPage> {

List datos = [
    'Izamal',
    'Valladolid',
    'Homún',
  ];

List descripcion = [
    'Izamal se localiza a 72 km al oriente de la ciudad de Mérida. Debe su nombre a un personaje de origen mítico y de singular sabiduría asumido como instructor, maestro y sacerdote de los mayas llamado Itzamná o Zamná que significa "Rocío que desciende del cielo".',
    'Valladolid es una ciudad hospitalaria y llena de historia que enorgullece a Yucatán. Durante siglos se le ha identificado por la riqueza del legado español plasmado en sus templos y el abolengo de sus viejos barrios. Tiene un excepcional sabor colonial.',
    'Homún es una localidad del estado de Yucatán, México, cabecera del municipio homónimo, ubicada aproximadamente 55 kilómetros al sureste de la ciudad de Mérida, capital del estado, y 10 km al sureste de la ciudad de Acanceh.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedListView(
          padding: const EdgeInsets.all(15.0),
            duration: 100,
            extendedSpaceBetween: 30,
            spaceBetween: 10,
            children: List.generate(
                3,
                (index) => Card(
                      elevation: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      shadowColor: Colors.black,
                      color: Colors.black54,
                      child: SizedBox(
                        height: 280,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                datos[index].toString().toUpperCase(),
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Divider(),
                              Text(
                                descripcion[index].toString().toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))));
  }
}
