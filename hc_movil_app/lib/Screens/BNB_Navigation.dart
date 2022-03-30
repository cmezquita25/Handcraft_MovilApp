
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hc_movil_app/Screens/Home.dart';
import 'package:hc_movil_app/Screens/Pin_pois.dart';
import 'package:hc_movil_app/Screens/Popular.dart';
import 'package:hc_movil_app/Screens/Travel.dart';

class BNB_Navigation extends StatefulWidget {
  @override
  _BNB_NavigationState createState() => _BNB_NavigationState();
}

class _BNB_NavigationState extends State<BNB_Navigation> {
  int index = 0;
  final screens = [
    HomePage(),
    TravelPage(),
    PopularPage(),
    Pin_pois_Page(),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
              appBar: AppBar(
          title: Text(
            'HandCraft Route'.toUpperCase(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          //POR SI OCUPAN UN CERRADO DE SESION

          // actions: <Widget>[
          //   IconButton(
          //     // ignore: prefer_const_constructors
          //     icon: Icon(
          //       Icons.logout_outlined,
          //       color: Colors.black,
          //     ),
          //     onPressed: () => showDialog<String>(
          //       context: context,
          //       builder: (BuildContext context) => AlertDialog(
          //         title: const Text('Estas a punto de cerrar sesion'),
          //         content: const Text('¿Estas seguro?'),
          //         actions: <Widget>[
          //           TextButton(
          //             onPressed: () => Navigator.pop(context, 'Cancel'),
          //             child: const Text('No'),
          //           ),
          //           TextButton(
          //             onPressed: () => Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) => TravelPage(),
          //               ),
          //             ),
          //             child: const Text('Si'),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          //   InkWell(
          //     child: Container(
          //       margin: const EdgeInsets.all(6),
          //       child: CircleAvatar(
          //         backgroundImage: const NetworkImage(
          //             'https://i.postimg.cc/rFXvLtVD/Brandon.jpg'),
          //         backgroundColor: Colors.grey[300],
          //       ),
          //     ),
          //   ),
          // ],
        ),
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        color: const Color.fromARGB(255, 67, 80, 108),
        backgroundColor: Colors.white12,
        index: index,
        animationDuration: const Duration(milliseconds: 250),
        items: const <Widget> [
          Icon(Icons.home, size: 25, color: Colors.white),
          Icon(Icons.travel_explore, size: 25, color: Colors.green),
          Icon(Icons.star_border_outlined, size: 25, color: Colors.yellow),
          Icon(Icons.pin_drop_outlined, size: 25, color: Colors.red),
        ],
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }
}
