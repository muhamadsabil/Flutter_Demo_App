import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

class Product {
  Product({
    this.productID,
    this.imageUrl,
    this.title,
    this.description,
    this.originalPrice,
    this.discountedPrice,
    this.discount,
    this.quantity,
    this.specifications,
    this.isWishListed

  }) ;

  final String imageUrl;
  final String title;
  final String description;
  final int originalPrice;
  final int discountedPrice;
  final String discount;
  final String productID;
  int quantity = 1;
  List<String> specifications = [];
  bool isWishListed = false;

}
extension ListUpdate<T> on List {
  List update(int pos, T t) {
    List<T> list = new List();
    list.add(t);
    replaceRange(pos, pos + 1, list);
    return this;
  }
}

List<Product> cartList = <Product>[];

final List<Product> productList = <Product>[

  Product(productID: '3454',
      imageUrl: 'https://images.unsplash.com/photo-1461151304267-38535e780c79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2000&q=80',
      description: 'Sony Bravia 108 cm (43 inches) Full HD Smart LED TV KDL-43W6603 (Black) (2020 Model)Smart TV | Screen Mirroring | Netflix | Amazon Prime Video | HDR Gaming',
      discountedPrice: 1200,
      originalPrice: 1500,
      discount: '16% OFF',
      title: 'Sony Bravia 108 cm (43 inches)Full HD Smart LED TV',
      quantity: 1,
      specifications: ['Resolution: Full HD (1920x1080) | HDR','Sound output: 20 Watts Output | Open Baffle Speaker | ClearAudio+ technology | TV MusicBox','Display: HDR | X-Reality Pro | Motionflow XR 100','Warranty Information : 1 year standard warranty provided by Sony from date of purchase'],
      isWishListed: false

  ),
  Product(productID: '453453',
      imageUrl: 'https://images.unsplash.com/photo-1593640409606-59cb8823175f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2378&q=80',
      description: 'HP Pavilion Intel Core i5 8th Gen 15.6-inch FHD',
      discountedPrice: 800,
      originalPrice: 950,
      discount: '24% OFF',
      title: 'HP Pavilion Intel Core i5 8th Gen 15.6-inch FHD',
      quantity: 1,
      specifications: ['Operating System: Pre-loaded Windows 10 Home with lifetime validity','Display: 14-inch HD (1366x768) display','Memory & Storage: 8GB DDR4 |Storage: 1TB 5400 rpm HDD + 256GB SSD','Pre-installed Software: Microsoft Office Home & Student 2019 |In the box: Laptop with included battery, charger'],
      isWishListed: false

  ),
  Product(productID: '123',
      imageUrl: 'https://images.unsplash.com/photo-1527434171365-3d9f55f5fb78?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
      description: 'Lenovo Ideapad Slim 3i 10th Gen Intel Core i5 Lenovo Ideapad Slim 3i 10th Gen Intel Core i5Lenovo Ideapad Slim 3i 10th Gen Intel Core i5Lenovo Ideapad Slim 3i 10th Gen Intel Core i5Lenovo Ideapad Slim 3i 10th Gen Intel Core i5Lenovo Ideapad Slim 3i 10th Gen Intel Core i5',
      discountedPrice: 4500,
      originalPrice: 5000,
      discount: '20% OFF',
      title: 'Lenovo Ideapad Slim 3i 10th Gen Intel Core i5',
      quantity: 1,
      specifications: ['Operating System: Pre-loaded Windows 10 Home with lifetime validity\n','Display: 14-inch HD (1366x768) display\n','Memory & Storage: 8GB DDR4 |Storage: 1TB 5400 rpm HDD + 256GB SSD','Pre-installed Software: Microsoft Office Home & Student 2019 |In the box: Laptop with included battery, charger'],
      isWishListed: false

  ),
  Product(productID: '333',
      imageUrl: 'https://images.unsplash.com/photo-1590325451637-766d6ac64b64?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
      description: 'Apple iPhone 11 (64GB) . 12MP TrueDepth front camera with Portrait mode, 4K video, and Slo-Mo. Manufacturer Detail: Apple Inc, One Apple Park Way, Cupertino, CA 95014, USA. ',
      discountedPrice: 800,
      originalPrice: 950,
      discount: '24% OFF',
      title: 'Apple iPhone 11 (64GB)',
      quantity: 1,
      specifications: ['6.1-inch (15.5 cm) Liquid Retina HD LCD display','Water and dust resistant (2 meters for up to 30 minutes, IP68)','A13 Bionic chip with third-generation Neural Engine','Wireless charging','Face ID for secure authentication and Apple Pay'],
      isWishListed: false

  ),

  Product(productID: '',
      imageUrl: 'https://images.unsplash.com/photo-1494698853255-d0fa521abc6c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2300&q=80',
      description: 'Apple MacBook Pro , 2.4GHz Intel Core i5 - Space Grey',
      discountedPrice: 3500,
      originalPrice: 4500,
      discount: '30% OFF',
      title: 'Apple MacBook Pro , 2.4GHz Intel Core i5 - Space Grey',
      quantity: 1,
      specifications: ['Operating System: Pre-loaded Windows 10 Home with lifetime validity','Display: 14-inch HD (1366x768) display','Memory & Storage: 8GB DDR4 |Storage: 1TB 5400 rpm HDD + 256GB SSD','Pre-installed Software: Microsoft Office Home & Student 2019 |In the box: Laptop with included battery, charger'],
      isWishListed: false


  ),
  Product(productID: '',
      imageUrl: 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1951&q=80',
      description: 'Apple MacBook Pro , 2.4GHz Intel Core i5 -  Silver',
      discountedPrice: 3500,
      originalPrice: 4500,
      discount: '30% OFF',
      title: 'Apple MacBook Pro , 2.4GHz Intel Core i5 -  Silver',
      quantity: 1,
      specifications: ['Operating System: Pre-loaded Windows 10 Home with lifetime validity','Display: 14-inch HD (1366x768) display','Memory & Storage: 8GB DDR4 |Storage: 1TB 5400 rpm HDD + 256GB SSD','Pre-installed Software: Microsoft Office Home & Student 2019 |In the box: Laptop with included battery, charger'],
      isWishListed: false


  ),
  Product(productID: '45345',
      imageUrl: 'https://images.unsplash.com/photo-1546868871-7041f2a55e12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80',
      description: 'Apple Watch Series 3 (GPS, 42mm) - Space Grey Aluminium Case with Black Sport Band. Accelerometer and gyroscope . S3 with dual-core processor',
      discountedPrice: 600,
      originalPrice: 800,
      discount: '35% OFF',
      title: 'Apple Watch Series 3 (GPS, 42mm) ',
      quantity: 1,
      specifications: ['GPS','Optical heart sensor','Apple Watch app','S3 with dual-core processor','Accelerometer and gyroscope','watchOS 5','Swimproof'],
      isWishListed: false

  ),
];





class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    this.label,
    this.padding,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Checkbox(
              value: value,
              activeColor: Colors.black,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
            Expanded(child: Text(label)),

          ],
        ),
      ),
    );
  }
}
