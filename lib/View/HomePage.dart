import 'package:flutter/material.dart';
import 'package:demoflutterapp/View/CarouselView.dart';
import 'package:demoflutterapp/View/HorizontalListView.dart';
import 'package:demoflutterapp/View/GridView.dart';
import 'package:demoflutterapp/View/RoundedBrandsView.dart';
import 'package:demoflutterapp/View/BottomCarouselView.dart';
import 'MainDrawer.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Moz Stuffs',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            letterSpacing: 4,
          ),
        ),
        backgroundColor: Colors.deepPurple[900],
        actions: <Widget>[
          new IconButton(
              icon: (Icon(
                Icons.bookmark,
                color: Colors.white,
              )),
              onPressed: () {
//            Navigator.pushNamed(context, 'cartPage');
              }),
          new IconButton(
              icon: (Icon(
                Icons.shopping_cart,
                color: Colors.white,
              )),
              onPressed: () {}),
          new IconButton(
              icon: (Icon(
                Icons.search,
                color: Colors.white,
              )),
              onPressed: () {}),
        ],
      ),
      drawer: MainDrawer(),
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
