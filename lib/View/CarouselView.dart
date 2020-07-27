import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselView extends StatefulWidget {
  @override
  _CarouselViewState createState() => _CarouselViewState();
}

class _CarouselViewState extends State<CarouselView> {
  int _current = 0;
  List imgList = [
    'assets/bg10.jpeg',
    'assets/bg7.jpeg',
    'assets/bg6.jpeg',
    'assets/bg8.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              initialPage: 0,
              enlargeCenterPage: true,
              autoPlay: true,
              reverse: false,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 2000),
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
//    pauseAutoPlayOnTouch: Duration(seconds: 10),
            items: imgList.map((imgUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: 500,
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      imgUrl,
                      fit: BoxFit.fill,
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
//        ),
//      height: 200.0,
//      child: Carousel(
//        boxFit: BoxFit.fill,
//        images: [
//          AssetImage('assets/bg10.jpeg'),
//          AssetImage('assets/bg7.jpeg'),
//          AssetImage('assets/bg6.jpeg'),
//          AssetImage('assets/bg8.jpeg'),
//        ],
//        autoplay: true,
//      animationCurve: Curves.fastOutSlowIn,
//      animationDuration: Duration(milliseconds: 1000),
//        dotSize: 8.0,
//        indicatorBgPadding: 2.0,
//        overlayShadow: true,
//      ),
    );
//    );
  }
}
