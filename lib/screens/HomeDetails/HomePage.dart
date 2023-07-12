import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/new_Item.dart';
import 'CustomCarouselSlider.dart';
import 'HomeTitleWidget.dart';
import 'Museun_detalis_page.dart';
import 'RecommendationItem.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: CircleAvatar(

            child: Image.asset('assets/logo.png'),
            maxRadius: 20,
          ),
        ),
        title: Text(
          "  Clopatra",
          style:TextStyle(
            color:Colors.white,
            fontSize: 32,
          ) ,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              children: [
                const SizedBox(height: 16.0),
                const HomeTitleWidget(title: 'SameKing'),
                const SizedBox(height: 8.0),
                const CustomCarouselSlider(),
                const SizedBox(height: 16.0),
                const HomeTitleWidget(title: 'Recommendation museum'),
                const SizedBox(height: 8.0),
                ...news
                    .map((newsItem) => Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: InkWell(
                    onTap: () {
                      final index = news.indexOf(newsItem);

                      Navigator.of(context, rootNavigator: true).push(
                        CupertinoPageRoute(
                          builder: (_) => Museun_detalis_page(
                            index: index,
                          ),
                        ),
                      ).then((value) => setState(() {

                      },));
                    },
                    child: RecommendationItem(newsItem: newsItem),
                  ),
                ))
                    .toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
