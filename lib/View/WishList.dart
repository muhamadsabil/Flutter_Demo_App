import 'package:demoflutterapp/View/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'PLP.dart';
import 'PDP.dart';

class WishList extends StatelessWidget {
  WishList({Key key, this.title}) : super(key: key);
  final String title;

  Widget build(BuildContext context) {
    return Scaffold(
        body: WishListDetails()
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

    items.clear();
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
//          automaticallyImplyLeading: false,
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
            child = generateWishListItem(destination);
            return Container(
              margin: const EdgeInsets.only(bottom: 2.0),
              child: child,
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget generateWishListItem(Product destination){

    var wishListIcon = destination.isWishListed ? new Icon(Icons.star) : new Icon(Icons.star_border);

    final TextStyle descriptionStyle = TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.normal, fontSize: 16.0);
    const double height = 300.0;
    final ShapeBorder shape  =  _shape;



   return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: height,
            child: Card(
              // This ensures that the Card's children (including the ink splash) are clipped correctly.
              clipBehavior: Clip.antiAlias,
              shape: shape,
              child: InkWell(
                onTap: () {
                  print('Card was tapped');
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PDP(destination)));
                },
                // Generally, material cards use onSurface with 12% opacity for the pressed state.
                splashColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                // Generally, material cards do not have a highlight overlay.
                highlightColor: Colors.transparent,
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // Photo and title.
                  SizedBox(
                    height: 210.0,
                    child: Stack(
                      children: <Widget>[

                        Positioned.fill(
                            child: Ink.image(
                              fit: BoxFit.fill,
                              image:NetworkImage(destination.imageUrl),
                              height: 170.0,
                              width: 530.0,
                            )),
                        Container(

                          alignment: Alignment.topRight,
                          padding: EdgeInsets.only(right: 5.0,top: 4.0),
                          child: IconButton(
                              icon: wishListIcon,
                              onPressed: () {
                                setState(() {
                                  print('wishlist');
                                  destination.isWishListed = !destination.isWishListed;
                                  if(destination.isWishListed){
                                    showAlertDialog(context, '    Item was added to your wishlist !     ');
                                  }
                                  else{
                                    showAlertDialog(context, '    Item was removed from your wishlist !   ');
                                  }


                                });

                              }),


                        ),
                      ],
                    ),

                  ),
                  // Description and share/explore buttons.
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6.0, 6.0, 0.0, 0.0),
                    child: DefaultTextStyle(
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: descriptionStyle,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // three line description
                          Padding(
                            padding: const EdgeInsets.only(bottom: 0.0),
                            child: Text(
                              destination.title,
                              maxLines: 3,
                              style: descriptionStyle.copyWith(color: Colors.black54),
                            ),
                          ),
                          SizedBox(height: 5.0),

                          Row(
                              children: <Widget>[
                                Text(destination.discountedPrice.toString() + 'AED',style: descriptionStyle.copyWith(color: Colors.indigo,fontWeight: FontWeight.bold),),
                                SizedBox(width: 5.0),
                                Text(destination.originalPrice.toString() + 'AED',style: descriptionStyle.copyWith(color: Colors.grey,fontWeight: FontWeight.normal,decoration:TextDecoration.lineThrough),),
                                SizedBox(width: 5.0),
                                Text(destination.discount ,style: descriptionStyle.copyWith(color: Colors.redAccent,fontWeight: FontWeight.normal),),

                              ]
                          )
//                Text(destination.location),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ),
            ),
          ),
        ],
      ),
    );









  }
}





//class WishlistProductContent extends StatefulWidget {
//
//  WishlistProductContent({ Key key, @required this.destination })
//      : assert(destination != null),
//        super(key: key);
//
//  Product destination;
//
//  @override
//  _WishlistProductContentState createState() => _WishlistProductContentState(destination);
//}
//
//class _WishlistProductContentState extends State<WishlistProductContent> {
//  Product destination;
//  var wishListIcon ;
//  _WishlistProductContentState(Product item){
//    destination = item;
//  }
//  @override
//  Widget build(BuildContext context) {
//    wishListIcon = destination.isWishListed ? new Icon(Icons.star) : new Icon(Icons.star_border);
//
//    final ThemeData theme = Theme.of(context);
//    final TextStyle descriptionStyle = theme.textTheme.subtitle1;
//
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.stretch,
//      children: <Widget>[
//        // Photo and title.
//        SizedBox(
//          height: 210.0,
//          child: Stack(
//            children: <Widget>[
//
//              Positioned.fill(
//                  child: Ink.image(
//                    fit: BoxFit.fill,
//                    image:NetworkImage(destination.imageUrl),
//                    height: 170.0,
//                    width: 530.0,
//                  )),
//              Container(
//
//                alignment: Alignment.topRight,
//                padding: EdgeInsets.only(right: 5.0,top: 4.0),
//                child: IconButton(
//                    icon: wishListIcon,
//                    onPressed: () {
//                      setState(() {
//                        print('wishlist');
//                        destination.isWishListed = !destination.isWishListed;
////                        if(destination.isWishListed){
////                          showAlertDialog(context, '    Item was added to your wishlist!     ');
////                        }
////                        else{
////                          showAlertDialog(context, '    Item was removed from your wishlist!   ');
////                        }
//
//
//                      });
//
//                    }),
//
//
//              ),
//            ],
//          ),
//
//        ),
//        // Description and share/explore buttons.
//        Padding(
//          padding: const EdgeInsets.fromLTRB(6.0, 6.0, 0.0, 0.0),
//          child: DefaultTextStyle(
//            softWrap: false,
//            overflow: TextOverflow.ellipsis,
//            style: descriptionStyle,
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                // three line description
//                Padding(
//                  padding: const EdgeInsets.only(bottom: 0.0),
//                  child: Text(
//                    destination.title,
//                    maxLines: 3,
//                    style: descriptionStyle.copyWith(color: Colors.black54),
//                  ),
//                ),
//                SizedBox(height: 5.0),
//
//                Row(
//                    children: <Widget>[
//                      Text(destination.discountedPrice.toString() + 'AED',style: descriptionStyle.copyWith(color: Colors.indigo,fontWeight: FontWeight.bold),),
//                      SizedBox(width: 5.0),
//                      Text(destination.originalPrice.toString() + 'AED',style: descriptionStyle.copyWith(color: Colors.grey,fontWeight: FontWeight.normal,decoration:TextDecoration.lineThrough),),
//                      SizedBox(width: 5.0),
//                      Text(destination.discount ,style: descriptionStyle.copyWith(color: Colors.redAccent,fontWeight: FontWeight.normal),),
//
//                    ]
//                )
////                Text(destination.location),
//              ],
//            ),
//          ),
//        ),
//      ],
//    );
//  }
//}