import 'package:flutter/material.dart';

class MyAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.deepPurple[900],
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                                image: AssetImage('assets/john.jpg')
                            )
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text('John',style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70
                      ),),
                      SizedBox(height: 10,),
                      Text('+009988776655',style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white70
                      ),),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text('jphnkasper@wix.com',style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.white70
                          ),),
                          SizedBox(width: 100,),
                          Icon(Icons.edit,color: Colors.white70,)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.white70,
                  height: 60,
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'My orders',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                        ),
                        SizedBox(width: 270,),
                        Icon(Icons.arrow_drop_down,)
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.white70,
                  height: 60,
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'My cards & wallets',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                        ),
                        SizedBox(width: 210,),
                        Icon(Icons.arrow_drop_down,)
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.white70,
                  height: 60,
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'My reviews',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                        ),
                        SizedBox(width: 265,),
                        Icon(Icons.arrow_drop_down,)
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.white70,
                  height: 60,
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'My addresses',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                        ),
                        SizedBox(width: 250,),
                        Icon(Icons.arrow_drop_down,)
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.white70,
                  height: 60,
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Moz electronic plus',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                        ),
                        SizedBox(width: 210,),
                        Icon(Icons.arrow_drop_down,)
                      ],
                    ),
                  ),
                ),
              ),
//              Padding(
//                padding: const EdgeInsets.all(10.0),
//                child: Container(
//                  color: Colors.white70,
//                  height: 60,
//                  width: 400,
//                  child: Padding(
//                    padding: const EdgeInsets.all(10.0),
//                    child: Row(
//                      crossAxisAlignment: CrossAxisAlignment.center,
//                      children: <Widget>[
//                        Text(
//                          'Moz notifications',style: TextStyle(
//                          fontWeight: FontWeight.w400,
//                          fontSize: 15,
//                        ),
//                        ),
//                        SizedBox(width: 210,),
//                        Icon(Icons.arrow_drop_down,)
//                      ],
//                    ),
//                  ),
//                ),
//              ),
            ],
          ),

        ),
      ),
    );
  }
}