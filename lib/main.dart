import 'package:flutter/material.dart';
import 'package:demoflutterapp/View/SplashScreen.dart';
import 'package:demoflutterapp/View/ProductDetails.dart';
import 'package:demoflutterapp/View/StartPage.dart';
import 'package:demoflutterapp/View/CarouselView.dart';
import 'package:demoflutterapp/View/GridView.dart';
import 'package:demoflutterapp/View/BottomCarouselView.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Colors.deepPurple[900]
    ),
    home: MyApp(),
  )
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splashScreen',
      routes: {
        'splashScreen': (context) => SplashScreen(),
        'productDetails': (context) => ProductDetails(),
        'startPage': (context) => StartPage(),
        'carouselView': (context) => CarouselView(),
        'gridView': (context) => GridViewPage(),
        'bottomCarouselView': (context) => BottomCarouselView(),
      },
    );
  }


}
