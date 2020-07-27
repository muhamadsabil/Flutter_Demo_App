import 'package:demoflutterapp/View/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'PLP.dart';

class WishList extends StatelessWidget {
  WishList({Key key, this.title}) : super(key: key);
  final String title;

  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'WishList',
        home: WishListDetails()
    ); // define it once at root level.
  }
}
class WishListDetails extends StatefulWidget {

  @override
  _WishListDetailsState createState() => _WishListDetailsState();
}

class _WishListDetailsState extends State<WishListDetails> {
  ShapeBorder _shape;
  List <Product> items = [];

  @override
  Widget build(BuildContext context) {

    for(Product item in productList){
      if(item.isWishListed){
        items.add(item);
      }
    }

    TextStyle minFontStyle = TextStyle(fontFamily: 'Montserrat', fontSize: 13.0);
    TextStyle maxFontStyle = TextStyle(fontFamily: 'Montserrat', fontSize: 16.0);

    if(items.isEmpty){

      return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('WishList'),
          backgroundColor: Colors.deepPurple[900],
        ),
        backgroundColor: Colors.white,
        body:Padding(
            padding: EdgeInsets.all(100.0),
            child : Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                SizedBox(height: 40.0),
                IconButton(
                    alignment: Alignment.center,
                    iconSize: 80.0,
                    icon: new Icon(Icons.card_giftcard),
                    color: Colors.deepPurple[900],
                    onPressed: () {
                    }),
                Text('Your wishlist is empty.\n',style :maxFontStyle.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                SizedBox(height: 20.0),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.deepPurple[900],
                  child: MaterialButton(
                    minWidth: 350.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PLP()),
                      );
                    },
                    child: Text("Continue Shopping",
                        textAlign: TextAlign.center,
                        style: minFontStyle.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),

                ),

              ],
            )),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wish List'),
         backgroundColor: Colors.deepPurple[900]
      ),
      body: Scrollbar(
        child: ListView(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          children: items.map<Widget>((Product destination) {
            Widget child;
            child = ProductItem(productDetail: destination, shape: _shape);
            return Container(
              margin: const EdgeInsets.only(bottom: 2.0),
              child: child,
            );
          }).toList(),
        ),
      ),
    );
  }
}