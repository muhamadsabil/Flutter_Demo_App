import 'package:flutter/material.dart';
import 'package:demoflutterapp/View/CarouselView.dart';
import 'package:demoflutterapp/View/HorizontalListView.dart';
import 'package:demoflutterapp/View/GridView.dart';
import 'package:demoflutterapp/View/RoundedBrandsView.dart';
import 'package:demoflutterapp/View/BottomCarouselView.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            CarouselView(),
            SizedBox(
              height: 10,
            ),
            Text(
              'CATEGORIES',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2,
                  fontFamily: 'TitilliumWeb-Light'),
            ),
            SizedBox(
              height: 10,
            ),
            HorizontalListView(),
            SizedBox(
              height: 10,
            ),
            Text(
              'BEST BUYS',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2,
                  fontFamily: 'TitilliumWeb-Light'),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 400.0,
              child: GridViewPage(),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'BEST BRANDS',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2,
                  fontFamily: 'TitilliumWeb-Light'),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200.0,
              child: RoundedBrandView(),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'E-GIFT CARDS',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2,
                  fontFamily: 'TitilliumWeb-Light'),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 170.0,
              child: BottomCarouselView(),
            ),
          ],
        ),
      ),
    );
  }
}
