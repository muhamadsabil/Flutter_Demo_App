import 'package:flutter/material.dart';
import 'PLP.dart';

class GridViewPage extends StatefulWidget {
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  var product_list = [
    {
      "name": "TABLETS",
      "picture": "assets/tablet.jpg",
      "offer": "UP TO 50% OFF",
    },
    {
      "name": "SMART WATCHES",
      "picture": "assets/watches.jpg",
      "offer": "UP TO 20% OFF",
    },
    {
      "name": "SPEAKER",
      "picture": "assets/speaker1.jpg",
      "offer": "UP TO 65% OFF",
    },
    {
      "name": "POWER BANK",
      "picture": "assets/powerbank.jpeg",
      "offer": "UP TO 35% OFF",
    },
    {
      "name": "CAMERA",
      "picture": "assets/camera.jpeg",
      "offer": "UP TO 30% OFF",
    },
    {
      "name": "HEADSETS",
      "picture": "assets/Headsets.jpg",
      "offer": "UP TO 40% OFF",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: GridView.builder(
          itemCount: product_list.length,
          gridDelegate:
              new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Single_prod(
              prod_name: product_list[index]['name'],
              prod_pricture: product_list[index]['picture'],
              prod_price: product_list[index]['offer'],
            );
          }),
    );
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_pricture;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_pricture,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PLP()),
            );
          },
          child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
//                  leading: Text(
//                    prod_name,
//                    style: TextStyle(fontWeight: FontWeight.bold),
//                  ),
                  title: Text(
                    "\ $prod_price",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 15),
                  ),
//                  subtitle: Text(
//                    "\$$prod_old_price",
//                    style: TextStyle(
//                        color: Colors.black54,
//                        fontWeight: FontWeight.w800,
//                        decoration
//                            :TextDecoration.lineThrough),
//                  ),
                ),
              ),
              child: Image.asset(
                prod_pricture,
                fit: BoxFit.contain,
              )),
        ),
      ),
    );
  }
}
