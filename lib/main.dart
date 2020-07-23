import 'package:flutter/material.dart';
import 'package:demoflutterapp/View/Splash_Screen.dart';
import 'dart:async';
void main(){
  runApp(MaterialApp(
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
  void initState(){
    super.initState();
    Future.delayed(
      Duration(
        seconds: 3),
        (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => SplashScreen(),
        ),
        );
        },
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 400,
        ),
      ),
    );
  }
}
