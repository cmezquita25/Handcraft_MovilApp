
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hc_movil_app/Pages/Recorridos_pin.dart';
import 'package:hc_movil_app/Pages/Recorridos_popular.dart';
import 'package:hc_movil_app/Pages/Recorridos_tours.dart';
import 'package:hc_movil_app/Pages/Recorridos_travel.dart';
import 'package:hc_movil_app/Screens/Home.dart';


class BNB_Navigation extends StatefulWidget {
  @override
  _BNB_NavigationState createState() => _BNB_NavigationState();
}

class _BNB_NavigationState extends State<BNB_Navigation> {
  int index = 0;
  final screens = [
    HomeScreen(),
    TravelPage(),
    PopularPage(),
    const Pin_pois_Page(),
    const Gastronomicos(),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        color: const Color.fromARGB(255, 67, 80, 108),
        backgroundColor: const Color.fromARGB(255, 236, 240, 241),
        index: index,
        animationDuration: const Duration(milliseconds: 250),
        items: const <Widget> [
          Icon(Icons.home, size: 25, color: Colors.white),
          Icon(Icons.travel_explore, size: 25, color: Colors.green),
          Icon(Icons.star_border_outlined, size: 25, color: Colors.yellow),
          Icon(Icons.pin_drop_outlined, size: 25, color: Colors.red),
          Icon(Icons.fastfood_outlined, size: 25, color: Colors.orange),
        ],
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }
}


