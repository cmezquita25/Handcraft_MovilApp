import 'package:flutter/material.dart';

class Pin_pois_Page extends StatefulWidget {
  @override
  _Pin_pois_Pagetate createState() => _Pin_pois_Pagetate();
}
class _Pin_pois_Pagetate extends State<Pin_pois_Page> {

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
          "Poi's".toUpperCase(),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        ),
      );
}
