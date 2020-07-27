import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

import 'Product.dart';
import 'PDP.dart';


class PLP extends StatelessWidget {
  PLP({Key key, this.title}) : super(key: key);
  final String title;

  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Electronics',
        home: PLPDetails()
    ); // define it once at root level.
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({ Key key, @required this.productDetail, this.shape })
      : assert(productDetail != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  static const double height = 300.0;
  final Product productDetail;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
//    var wishListText = productDetail.isWishListed ? IconButton(Ic) : ;

    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PDP(productDetail)));
                  },
                  // Generally, material cards use onSurface with 12% opacity for the pressed state.
                  splashColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                  // Generally, material cards do not have a highlight overlay.
                  highlightColor: Colors.transparent,
                  child: ProductContent(destination: productDetail),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductContent extends StatefulWidget {

  ProductContent({ Key key, @required this.destination })
      : assert(destination != null),
        super(key: key);

  Product destination;

  @override
  _ProductContentState createState() => _ProductContentState(destination);
}

class _ProductContentState extends State<ProductContent> {
  Product destination;
  var wishListIcon ;
  _ProductContentState(Product item){
    destination = item;
  }
  @override
  Widget build(BuildContext context) {
    wishListIcon = destination.isWishListed ? new Icon(Icons.star) : new Icon(Icons.star_border);

    final ThemeData theme = Theme.of(context);
    final TextStyle descriptionStyle = theme.textTheme.subtitle1;

    return Column(
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
    );
  }
}
class PLPDetails extends StatefulWidget {
  static const String routeName = '/material/cards';

  @override
  _PLPDetailsState createState() => _PLPDetailsState();
}

class _PLPDetailsState extends State<PLPDetails> {
  ShapeBorder _shape;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PLP'),
        backgroundColor: Colors.deepPurple[900],
      ),
      body: Scrollbar(
        child: ListView(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          children: productList.map<Widget>((Product destination) {
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