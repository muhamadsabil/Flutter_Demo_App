import 'package:demoflutterapp/View/Product.dart';
import 'package:flutter/material.dart';
import 'DropDownComponent.dart';
import 'Product.dart';
import 'OrderReviewPage.dart';
import 'PDP.dart';
import 'PLP.dart';

class Cart extends StatefulWidget {

  Cart({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CartState();
  }
}

class CartState extends State<Cart> {
  List<Product> cartItems = cartList;

  num ordertotal = 0;

  Widget generateCart(Product item) {

    String _dropDownButtonValue = item.quantity.toString();

    List<String> items = ['1', '2', '3', '4', '5'];
    return Padding(
      padding: EdgeInsets.all(0.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white12,
            border: Border(
              bottom: BorderSide(color: Colors.grey[100], width: 1.0),
              top: BorderSide(color: Colors.grey[100], width: 1.0),
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
                  child: InkWell(
                    onTap: () {
                      print('Card was tapped');
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PDP(item)));
                    },
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          Container(
                            child: Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: IconButton(
                                  icon: new Icon(Icons.delete),
                                  onPressed: () {

                                    setState(() {

                                      var itemIndex = cartList.indexOf(item);
                                      cartList.removeAt(itemIndex);
                                    });



                                  }),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(children: <Widget>[
                        Text("Price : " + item.discountedPrice.toString() + 'AED'),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(item.originalPrice.toString()+ "AED", style:TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.normal,decoration:TextDecoration.lineThrough)),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(item.discount, style:TextStyle(
                            color: Colors.redAccent, fontWeight: FontWeight.normal))
                      ]),
                      Row(children: <Widget>[
                        Text("Quantity :  "),
//                    DropDownWidget(items),
                        DropdownButton(
                          focusColor: Colors.blue,
                          hint: Text(_dropDownButtonValue), //text shown on the button (optional)
                          elevation: 3,
                          items: <String>['1', '2', '3', '4','5']
                              .map((String val) => DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _dropDownButtonValue = value;
                              item.quantity = int.parse(_dropDownButtonValue);

                            });
                          },
                        )

                      ]),
                    ],
                  ),
                )))
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
    TextStyle minFontStyle = TextStyle(fontFamily: 'Montserrat', fontSize: 13.0);
    TextStyle maxFontStyle = TextStyle(fontFamily: 'Montserrat', fontSize: 16.0);

    if(cartList.isEmpty){

      return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Cart'),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.deepPurple[900],
        ),
        backgroundColor: Colors.white,
        body:Padding(
            padding: EdgeInsets.all(100.0),
            child : Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                SizedBox(height: 40.0),
                IconButton(
                    alignment: Alignment.center,
                    iconSize: 80.0,
                    icon: new Icon(Icons.card_giftcard),
                    color: Colors.deepPurple[900],
                    onPressed: () {
                    }),
                Text('Your cart is empty.\n',style :maxFontStyle.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                SizedBox(height: 20.0),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.deepPurple[900],
                  child: MaterialButton(
                    minWidth: 350.0,
//                padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 15.0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PLP()),
                      );

                    },
                    child: Text("Continue Shopping",
                        textAlign: TextAlign.center,
                        style: style.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),

                ),

              ],
            )),
      );
    }

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Cart"),
        backgroundColor: Colors.deepPurple[900],

      ),
      backgroundColor: Colors.white,
      body: Scrollbar(
          child: Column(children: <Widget>[
            Expanded(
              child: ListView(
                shrinkWrap: false,
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
              flex : 3,

            ),
            Expanded(

              child : Column(children: <Widget>[
                Container(height: 1.0,padding: EdgeInsets.all(4.0),decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      left: BorderSide(color: Colors.grey[100], width: 3.0),
                      right: BorderSide(color: Colors.grey[100], width: 3.0),

                      top: BorderSide(color: Colors.grey[100], width: 3.0),
                      bottom: BorderSide(color: Colors.grey[100], width: 3.0),
//              top: BorderSide(color: Colors.grey[100], width: 1.0),
                    )),),
                SizedBox(height: 10.0),

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
                  color: Colors.deepPurple[900],
                  child: MaterialButton(
                    minWidth: 350.0,
                    padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 15.0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OrderReview(title: 'Order Details',)),
                      );
                    },
                    child: Text("Proceed To Buy",
                        textAlign: TextAlign.center,
                        style: style.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ]),
            ),
          ])),
    );
  }
}
