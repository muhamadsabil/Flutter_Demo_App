import 'package:demoflutterapp/View/Product.dart';
import 'package:flutter/material.dart';
import 'OrderConfirmationPage.dart';
import 'Product.dart';

class OrderReview extends StatefulWidget {

  OrderReview({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OrderReviewState(title);
  }
}

class OrderReviewState extends State<OrderReview> {
  String title = '';

  List<Product> cartItems = cartList;

  num ordertotal = 0;
  OrderReviewState(String title){
    this.title = title;
  }

  Widget generateCart(Product item) {
    List<String> items = ['1', '2', '3', '4', '5'];
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white12,
            border: Border(
              bottom: BorderSide(color: Colors.grey[100], width: 1.0),
//              top: BorderSide(color: Colors.grey[100], width: 1.0),
            )),
        height: 150.0,
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 5.0)
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  image: DecorationImage(
                      image: NetworkImage(item.imageUrl), fit: BoxFit.fill)),
            ),
            Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              item.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15.0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text("Price : " + item.discountedPrice.toString() + 'AED'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(children: <Widget>[
                        Text("Quantity :  "),
                        Text(item.quantity.toString()),
                      ]),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 13.0);

    var total = 0;
    for(Product item in cartItems){
      total += (item.quantity * item.discountedPrice);
    }
    ordertotal = total;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(title),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView( //add to Scroll whole screen

          child: Column(
              verticalDirection: VerticalDirection.down,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    left: BorderSide(color: Colors.grey[100], width: 3.0),
                    right: BorderSide(color: Colors.grey[100], width: 3.0),

                    top: BorderSide(color: Colors.grey[100], width: 3.0),
                    bottom: BorderSide(color: Colors.grey[100], width: 3.0),
//              top: BorderSide(color: Colors.grey[100], width: 1.0),
                  )),
              child :Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 15.0),
                  child:Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text("User Address Details",textAlign: TextAlign.center,style:style.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8.0),
                        Text("Shipping Address",textAlign: TextAlign.left,style:style.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                        Text("Arthur Fleck,\n345 Nehru street,\nChepak ,Chennai - 600345\nMobile Number : 345345345345",textAlign: TextAlign.left,style:style.copyWith(
                            color: Colors.black, fontWeight: FontWeight.normal)),
                        SizedBox(height: 8.0),

                      ]
                  )),
//              decoration: BoxDecoration(
//                  border: Border.all(color: Colors.grey)
//              ),
            ),
            SizedBox(height: 2.0),

                SizedBox(
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    children: cartItems.map<Widget>((Product item) {
                      Widget child;
                      child = generateCart(item);
                      return Container(
                        margin: const EdgeInsets.only(bottom: 2.0),
                        child: child,
                      );
                    }).toList(),
                  ),
                  // flex : 4,

                ),
            SizedBox(
              height: 60.0,
              child: Container(
    decoration: BoxDecoration(
    color: Colors.white,
    border: Border(
      left: BorderSide(color: Colors.grey[100], width: 3.0),
       right: BorderSide(color: Colors.grey[100], width: 3.0),

    top: BorderSide(color: Colors.grey[100], width: 3.0),
      bottom: BorderSide(color: Colors.grey[100], width: 3.0),
//              top: BorderSide(color: Colors.grey[100], width: 1.0),
    )),
    child: LabeledCheckbox(
                label: 'Cash On Delivery',
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                value: true,
                onChanged: (bool newValue) {
//                  setState(() {
//                    _isSelected = newValue;
//                  });
                },
              )
              ),
            ),
            SizedBox(

              child : Column(children: <Widget>[
                SizedBox(height: 15.0),
                Text("Order Total :  "+ ordertotal.toString()+"AED",textAlign: TextAlign.right,style:style.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold)),
                SizedBox(height: 5.0),

                Text("VAT :  "+"65"+"AED",textAlign: TextAlign.right,style:style.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold)),
                SizedBox(height: 5.0),

                Text("TotalAmount : "+(ordertotal + 65).toString()+"AED",textAlign: TextAlign.right,style:style.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold)),
                SizedBox(height: 15.0),

                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.blue,
                  child: MaterialButton(
                    minWidth: 350.0,
                    padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 15.0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OrderConfirmationPage()),
                      );
                    },
                    child: Text("Place Order",
                        textAlign: TextAlign.center,
                        style: style.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(height: 20.0),

              ]),
            ),

          ])
      ),
    );
  }
}
