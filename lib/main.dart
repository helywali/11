import 'package:cleopatra/splach.dart';
import 'package:flutter/material.dart';
import 'package:cleopatra/constants/constants.dart';
import 'package:cleopatra/screens/home/home_screen.dart';
import 'package:flutter/services.dart';

import 'screens/maps/flutter_map.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Estate App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: white),
      home: SplashScreen(),
    );
  }
}
