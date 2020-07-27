import 'package:flutter/material.dart';

class HorizontalListView extends StatefulWidget {
  @override
  _HorizontalListViewState createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      width: 110,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            imageLocation: 'assets/Phone.jpeg',
            imageCaption: 'Mobiles',
          ),
          Category(
            imageLocation: 'assets/Laptop.jpeg',
            imageCaption: 'Laptops',
          ),
          Category(
            imageLocation: 'assets/watch.jpg',
            imageCaption: 'Watches',
          ),
          Category(
            imageLocation: 'assets/pendrive.jpg',
            imageCaption: 'Pen drives',
          ),
          Category(
            imageLocation: 'assets/breadmaker.jpg',
            imageCaption: 'Toaster',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  @override
  final String imageLocation;
  final String imageCaption;

  Category({this.imageLocation, this.imageCaption});

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        color: Colors.grey[200],
        width: 110,
        child: ListTile(
            title: Container(
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        imageLocation,
                      ))),
//              child: Image.asset(imageLocation,
//                width: 50,height: 80,fit: BoxFit.fill,),
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                imageCaption,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            )),
      ),
    );
  }
}
