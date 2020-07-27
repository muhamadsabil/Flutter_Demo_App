import 'package:demoflutterapp/View/PLP.dart';
import 'package:demoflutterapp/View/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Product.dart';
import 'Cart.dart';

class PDP extends StatefulWidget {
  Product itemDetail;
  PDP(Product item){
    this.itemDetail = item;
  }
  @override
  _PDPState createState() => _PDPState(itemDetail);
}

class _PDPState extends State<PDP> {
  Product itemDetail;
  _PDPState(Product item){
    this.itemDetail = item;
  }
  var wishListText;

  TextStyle minFontstyle = TextStyle(fontFamily: 'Montserrat', fontSize: 13.0);
  TextStyle maxFontstyle = TextStyle(fontFamily: 'Montserrat', fontSize: 14.0);

  @override
  Widget build(BuildContext context) {
    wishListText = (itemDetail.isWishListed) ? 'Remove from Wishlist' : 'Add to Wishlist';

    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Details'),
        ),
        backgroundColor: Colors.white,
        body:Padding(
            padding: EdgeInsets.all(10.0),
            child : SingleChildScrollView( //add to Scroll whole screen
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Text(itemDetail.title, style:maxFontstyle.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                    maxLines: 2,),
                  SizedBox(
                    height: 10.0,
                  ),
                  new Image(
                    image: NetworkImage(itemDetail.imageUrl)
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      Text(itemDetail.discountedPrice.toString() + "AED", style:maxFontstyle.copyWith(
                          color: Colors.indigo, fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(itemDetail.originalPrice.toString()+ "AED", style:maxFontstyle.copyWith(
                          color: Colors.grey, fontWeight: FontWeight.normal,decoration:TextDecoration.lineThrough)),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(itemDetail.discount, style:maxFontstyle.copyWith(
                          color: Colors.redAccent, fontWeight: FontWeight.normal))

                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Product Description : ',style:maxFontstyle.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 8.0,
                  ),
                  new Text(itemDetail.description, style:maxFontstyle.copyWith(
                      color: Colors.black, fontWeight: FontWeight.normal)),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Specification : ',style:maxFontstyle.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 8.0,
                  ),
//          Text(itemDetail.specifications.first),
                  ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    children: itemDetail.specifications.map<Widget>((String spec) {
                      Widget child;
                      child = Text(spec);
                      return Container(
                        margin: const EdgeInsets.only(bottom: 2.0),
                        child: child,
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.blue,
                    child: MaterialButton(
                      minWidth: 250.0,
                      padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 15.0),
                      onPressed: () {

                        if(cartList.contains(itemDetail)){
                          itemDetail.quantity += 1;
                        }
                        else{
                          cartList.add(itemDetail);
                        }

                        showAlertDialog(context);

                      },
                      child: Text("Add To Cart",
                          textAlign: TextAlign.center,
                          style: minFontstyle.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.blue,
                    child: MaterialButton(
                      minWidth: 250.0,
                      padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 15.0),

                      child: Text(wishListText,
                          textAlign: TextAlign.center,
                          style: minFontstyle.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        setState(() {
                          itemDetail.isWishListed = !itemDetail.isWishListed;
                        });
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => OrderReview(title: 'Order Details',)),
//                );
                      },
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button

  Widget cartButton = FlatButton(
    child: Text("View Cart"),
    onPressed: () {

      Navigator.of(context, rootNavigator: true).pop();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Cart()),
      );
    },
  );
  Widget continueButton = FlatButton(
    child: Text("Continue Shopping"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PLP()),
      );
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    content: Text("Item has been added to your cart successfully."),
//    content: Text("User details have been saved successfully"),
  contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 0.0),
    actions: [
      continueButton,cartButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}