import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hc_movil_app/Animated_intro.dart';
import 'package:hc_movil_app/Screens/BNB_Navigation.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:hc_movil_app/providers/ArtesanosCooperativa_Provider.dart';
import 'package:hc_movil_app/providers/Artesanos_Provider.dart';
import 'package:hc_movil_app/providers/Productos_Provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) =>
      super.createHttpClient(context)
        ..badCertificateCallback = ((cert, host, port) => true);
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HttpOverrides.global = MyHttpOverrides();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ArtesanosProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (context) => ArtesanosCooperativaProvider(),
          lazy: false,
        ),
        // ChangeNotifierProvider(
        //   create: (context) => ProductosProvider(),
        //   lazy: false,
        // ),
        // ChangeNotifierProvider(
        //   create: (context) => ToursProvider(),
        //   lazy: false,
        // ),
      ],
      child: const Main(),
    );
  }
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

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
      home: const Animated_intro(),
    );
  }
}
