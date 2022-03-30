import 'package:flutter/material.dart';
import 'package:hc_movil_app/Screens/BNB_Navigation.dart';
import 'package:flutter/src/material/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HandCraft Route',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 201, 129, 230),
        accentColor: const Color.fromARGB(255, 94, 122, 189),
      ),
      home: BNB_Navigation(),
    );
  }
}
