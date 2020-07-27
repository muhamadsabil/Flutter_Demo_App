import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class BottomCarouselView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 160.0,
        child: new Carousel(
          boxFit: BoxFit.fill,
          images: [
            AssetImage('assets/card1.png'),
            AssetImage('assets/card2.png'),
            AssetImage('assets/card3.png'),
          ],
          autoplay: true,
          showIndicator: true,
//      animationCurve: Curves.fastOutSlowIn,
//      animationDuration: Duration(milliseconds: 1000),
          dotSize: 5.0,
          indicatorBgPadding: 1.0,
        ),
      ),
    );
  }
}
