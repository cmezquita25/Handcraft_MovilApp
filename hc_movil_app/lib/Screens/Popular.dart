import 'package:flutter/material.dart';

class PopularPage extends StatefulWidget {
  @override
  _PopularPageState createState() => _PopularPageState();
}
class _PopularPageState extends State<PopularPage> {

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
          'Popular'.toUpperCase(),
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
