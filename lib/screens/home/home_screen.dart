import 'package:flutter/material.dart';
import 'package:cleopatra/screens/home/components/bottom_buttons.dart';
import 'package:cleopatra/screens/home/components/categories.dart';
import 'package:cleopatra/screens/home/components/custom_app_bar.dart';
import 'package:cleopatra/screens/home/components/houses.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //44
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              CustomAppBar(),
              Categories(),
              Houses(),
            ],
          ),
          BottomButtons(),
        ],
      ),
    );
  }
}
