import 'dart:async';

import 'package:cleopatra/screens/HomeDetails/CustomBottomNavBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => CustomBottomNavBar()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Color(0xff7F3F3D),
          child:Center(
            child: Column(children: [
              const SizedBox(height: 70,),
              Image.asset('assets/logo.png'),

              const SizedBox(height: 10,),
              const Text(' Cleopatra',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
          ), )
    );
  }
}
