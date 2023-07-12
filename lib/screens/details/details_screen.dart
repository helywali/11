import 'package:flutter/material.dart';
import 'package:cleopatra/model/house.dart';
import 'package:cleopatra/screens/details/components/bottom_buttons.dart';
import 'package:cleopatra/screens/details/components/carousel_images.dart';
import 'package:cleopatra/screens/details/components/custom_app_bar.dart';
import 'package:cleopatra/screens/details/components/house_details.dart';

class DetailsScreen extends StatefulWidget {

  final House house;

  const DetailsScreen({ Key ?key, required this.house}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  CarouselImages(widget.house.moreImagesUrl),
                  CustomAppBar(),
                ],
              ),
              HouseDetails(widget.house),
            ],
          ),
          //BottomButtons(),
        ],
      ),
    );
  }
}
