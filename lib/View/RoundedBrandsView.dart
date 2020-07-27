import 'package:flutter/material.dart';

class RoundedBrandView extends StatefulWidget {
  @override
  _RoundedBrandViewState createState() => _RoundedBrandViewState();
}

class _RoundedBrandViewState extends State<RoundedBrandView> {
  var product_list = [
    {
      "picture": "assets/el1.png",
    },
    {
      "picture": "assets/el2.png",
    },
    {
      "picture": "assets/el3.png",
    },
    {
      "picture": "assets/el9.jpeg",
    },
    {
      "picture": "assets/el5.png",
    },
    {
      "picture": "assets/el13.jpg",
    },
    {
      "picture": "assets/el12.jpg",
    },
    {
      "picture": "assets/el8.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
//          physics: FixedExtentScrollPhysics(),
            itemCount: product_list.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, mainAxisSpacing: 20, crossAxisSpacing: 20),
            itemBuilder: (BuildContext context, int index) {
              return Single_prod(
                prod_pricture: product_list[index]['picture'],
              );
            }),
      ),
    );
  }
}

class Single_prod extends StatelessWidget {
//  final prod_name;
  final prod_pricture;

//  final prod_old_price;
//  final prod_price;

  Single_prod({
//    this.prod_name,
    this.prod_pricture,
//    this.prod_old_price,
//    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.0,
      height: 30.0,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              prod_pricture,
            )),
        borderRadius: BorderRadius.all(Radius.circular(38.0)),
        color: Colors.redAccent,
      ),
    );
  }
}
