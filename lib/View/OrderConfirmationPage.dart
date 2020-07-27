import 'package:flutter/material.dart';
import 'PLP.dart';

class OrderConfirmationPage extends StatefulWidget {
  @override
  _OrderConfirmationPageState createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
  TextStyle minFontStyle = TextStyle(fontFamily: 'Montserrat', fontSize: 13.0);
  TextStyle maxFontStyle = TextStyle(fontFamily: 'Montserrat', fontSize: 16.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('order Details'),
      ),
      backgroundColor: Colors.white,
      body:Column(
        children: <Widget>[

          SizedBox(height: 40.0),
          IconButton(
            alignment: Alignment.center,
            iconSize: 80.0,
              icon: new Icon(Icons.check_circle),
              color: Colors.green,
              onPressed: () {
              }),
          Text('Your Order is placed.\n',style :maxFontStyle.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          SizedBox(height: 20.0),

          Text('Order Number : #123-3434-234324 \n',style :maxFontStyle.copyWith(
              color: Colors.black, fontWeight: FontWeight.normal),textAlign: TextAlign.center),
          Padding(
            padding: EdgeInsets.all(10.0),
           child :Text('Thank you for shopping with us! \n Your order is being processed . You will receive an order confirmation shortly with the expected delivery date.\n',style :maxFontStyle.copyWith(
              color: Colors.black, fontWeight: FontWeight.normal),textAlign: TextAlign.center)
          ),
          SizedBox(height: 40.0),
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
      ),
    );
  }
}
