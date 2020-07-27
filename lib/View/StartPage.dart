import 'package:demoflutterapp/View/MainDrawer.dart';
import 'package:flutter/material.dart';
import 'package:demoflutterapp/View/CarouselView.dart';
import 'package:demoflutterapp/View/HomePage.dart';
import 'WishList.dart';
import 'Cart.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  int _currentIndex = 0;
  final List<Widget> tabs = [
//    ProductDetails(),
//    HomePage(),
//    CarouselView(),
    HomePage(),
    WishList(),
    Cart(),
    Cart()
//    SearchPage(),
//    CartPage(),
//    PlpViewer()
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurple[900],
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('WishList'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Cart'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Account'),
          ),
        ],
      ),
    );
  }
}
