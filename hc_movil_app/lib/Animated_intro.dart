// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:hc_movil_app/Screens/BNB_Navigation.dart';
import 'package:lottie/lottie.dart';

class Animated_intro extends StatefulWidget {
  const Animated_intro({Key? key}) : super(key: key);

  @override
  State<Animated_intro> createState() => _animated_introState();
}

class _animated_introState extends State<Animated_intro>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool _isLoaded = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isLoaded = true;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoaded
            ? BNB_Navigation()
            : Lottie.network('https://assets9.lottiefiles.com/packages/lf20_rfzwo31m.json', controller: _controller,
                onLoaded: (comp) {
                _controller.duration = comp.duration;
                _controller.forward();
              }),
      ),
    );
  }

  /*Widget inicio(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 40, right: 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("GARBAGE REPORT",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }*/
}
