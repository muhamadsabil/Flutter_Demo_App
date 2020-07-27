import 'package:flutter/material.dart';
import 'StartPage.dart';

import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.grey[100],
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/fav1.jpeg',),fit: BoxFit.fill
              )
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill, image: AssetImage('assets/bg3.png'))),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Container(
                    height: 400,
                    child: Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),

                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(color: Colors.grey[100]))),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Email or Phone number",
                                      hintStyle: TextStyle(color: Colors.grey[400]),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter email';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey[400]),
                                    ),
                                    obscureText: true,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter password ';
                                      }
                                      return null;
                                    },
                                  ),
                                )
                              ],
                            ),
//              )
                          ),
                          SizedBox(
                            height: 15,
                          ),
//              FadeAnimation(2,
//                          MaterialButton(
//                            height: 60,
//                            color: Colors.white,
//                            child: Center(
//                              child: Text(
//                                "Login",
//                                style: TextStyle(
//                                    color: Colors.deepPurple[900], fontWeight: FontWeight.bold,fontSize: 20),
//                              ),
//                            ),
//                            onPressed: () {
//                              if (_formKey.currentState.validate()) {
//                                Navigator.pushNamed(context, 'startPage');
//                              }
//
//                            },
//                            highlightColor: Colors.blueGrey,
//                          ),
                    Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.deepPurple[900],
                          child: MaterialButton(
                            minWidth: 350.0,
height: 60.0,
//                padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 15.0),
                            onPressed: () {
    if (_formKey.currentState.validate()) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => StartPage()));
//                              Navigator.pushNamed(context, 'startPage');
                            }
//

                            },//TextStyle(fontFamily: 'Montserrat', fontSize: 16.0)
                            child: Text("Login",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,fontSize: 16,fontFamily: 'Montserrat')),
                          ),

                        ),
//              ),
                          SizedBox(
                            height: 30,
                          ),
//              FadeAnimation(1.5,
                          Center(
                            child: RichText(
                              text: TextSpan(
                                  text: 'Don\'t have an account?  ',
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: 'SIGN UP',
                                      style: TextStyle(
                                          color: Colors.deepPurple[900], fontWeight: FontWeight.bold),
                                    )
                                  ]),
                            ),
                          ),
//              ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}


//class SignInScreen extends StatefulWidget {
//  @override
//  _SignInScreenState createState() => _SignInScreenState();
//}
//
//class _SignInScreenState extends State<SignInScreen> {
//  @override
//  final _formKey = GlobalKey<FormState>();
//
//  Widget build(BuildContext context) {
//    return Scaffold(
//        backgroundColor: Colors.grey[100],
//        body: Padding(
//          padding: const EdgeInsets.all(20.0),
//          child: Column(
//            children: <Widget>[
//              Padding(
//                padding: const EdgeInsets.all(10.0),
//                child: Container(
//                  height: 250,
//                  decoration: BoxDecoration(
//                      image: DecorationImage(
//                          fit: BoxFit.fill, image: AssetImage('assets/bg3.png'))),
//                ),
//              ),
//              Form(
//                key: _formKey,
//                child: Container(
//                  height: 400,
//                  child: Padding(
//                    padding: EdgeInsets.all(30.0),
//                    child: Column(
//                      children: <Widget>[
//                        Container(
//                          padding: EdgeInsets.all(5),
//                          decoration: BoxDecoration(
//                            color: Colors.white,
//                            borderRadius: BorderRadius.circular(10),
//                          ),
//
//                          child: Column(
//                            crossAxisAlignment: CrossAxisAlignment.stretch,
//                            children: <Widget>[
//                              Container(
//                                padding: EdgeInsets.all(8.0),
//                                decoration: BoxDecoration(
//                                    border: Border(
//                                        bottom: BorderSide(color: Colors.grey[100]))),
//                                child: TextFormField(
//                                  decoration: InputDecoration(
//                                    border: InputBorder.none,
//                                    hintText: "Email or Phone number",
//                                    hintStyle: TextStyle(color: Colors.grey[400]),
//                                  ),
//                                  keyboardType: TextInputType.emailAddress,
//                                  validator: (value) {
//                                    if (value.isEmpty) {
//                                      return 'Please enter email';
//                                    }
//                                    return null;
//                                  },
//                                ),
//                              ),
//                              Container(
//                                padding: EdgeInsets.all(8.0),
//                                child: TextFormField(
//                                  decoration: InputDecoration(
//                                    border: InputBorder.none,
//                                    hintText: "Password",
//                                    hintStyle: TextStyle(color: Colors.grey[400]),
//                                  ),
//                                  obscureText: true,
//                                  validator: (value) {
//                                    if (value.isEmpty) {
//                                      return 'Please enter password ';
//                                    }
//                                    return null;
//                                  },
//                                ),
//                              )
//                            ],
//                          ),
////              )
//                        ),
//                        SizedBox(
//                          height: 30,
//                        ),
////              FadeAnimation(2,
//                        Material(
//                          elevation: 5.0,
//                          borderRadius: BorderRadius.circular(30.0),
//                          color: Colors.deepPurple[900],
//                          child: MaterialButton(
//                            minWidth: 350.0,
//height: 60.0,
////                padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 15.0),
//                            onPressed: () {
//    if (_formKey.currentState.validate()) {
//      Navigator.push(context, MaterialPageRoute(builder: (context) => StartPage()));
////                              Navigator.pushNamed(context, 'startPage');
//                            }
////
//
//                            },//TextStyle(fontFamily: 'Montserrat', fontSize: 16.0)
//                            child: Text("Login",
//                                textAlign: TextAlign.center,
//                                style: TextStyle(
//                                  color: Colors.white, fontWeight: FontWeight.bold,fontSize: 16,fontFamily: 'Montserrat')),
//                          ),
//
//                        ),
////                        MaterialButton(
////                          elevation: 5.0,
////
////                          borderRadius: BorderRadius.circular(30.0),
////                          height: 60,
////                          color: Colors.deepPurple[900],
////                          child: Center(
////                            child: Text(
////                              "Login",
////                              style: TextStyle(
////                                  color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),
////                            ),
////                          ),
////                          onPressed: () {
////                            if (_formKey.currentState.validate()) {
////                              Navigator.pushNamed(context, 'startPage');
////                            }
////
////                          },
////                          highlightColor: Colors.blueGrey,
////                        ),
////              ),
//                        SizedBox(
//                          height: 30,
//                        ),
////              FadeAnimation(1.5,
//                        Center(
//                          child: RichText(
//                            text: TextSpan(
//                                text: 'Don\'t have an account?',
//                                style: TextStyle(color: Colors.black),
//                                children: [
//                                  TextSpan(
//                                    text: 'SIGN UP',
//                                    style: TextStyle(
//                                        color: Colors.deepPurple[900], fontWeight: FontWeight.bold),
//                                  )
//                                ]),
//                          ),
//                        ),
////              ),
//                      ],
//                    ),
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ));
//  }
//}
//


//import 'package:flutter/material.dart';
//
//class SignInScreen extends StatefulWidget {
//  @override
//  _SignInScreenState createState() => _SignInScreenState();
//}
//
//class _SignInScreenState extends State<SignInScreen> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.white,
//      body: ListView(
//        children: <Widget>[
//          Padding(
//            padding: const EdgeInsets.all(20.0),
//            child: Container(
//              height: 300,
//              decoration: BoxDecoration(
//                  image: DecorationImage(
//                      fit: BoxFit.fill, image: AssetImage('assets/bg20.jpeg'))),
//            ),
//          ),
//          SizedBox(
//            height: 20,
//          ),
//          Padding(
//            padding: const EdgeInsets.all(20.0),
//            child: Row(
//              children: <Widget>[
//                IconButton(icon: Icon(Icons.person), onPressed: null),
//                Expanded(
//                    child: Container(
//                        margin: EdgeInsets.only(right: 20, left: 10),
//                        child: TextField(
//                          decoration: InputDecoration(hintText: 'Username'),
//                        )))
//              ],
//            ),
//          ),
//          Padding(
//            padding: const EdgeInsets.all(20.0),
//            child: Row(
//              children: <Widget>[
//                IconButton(icon: Icon(Icons.lock), onPressed: null),
//                Expanded(
//                    child: Container(
//                        margin: EdgeInsets.only(right: 20, left: 10),
//                        child: TextField(
//                          decoration: InputDecoration(hintText: 'Password'),
//                        ))),
//              ],
//            ),
//          ),
//          SizedBox(
//            height: 20,
//          ),
//          Padding(
//            padding: const EdgeInsets.all(20.0),
//            child: ClipRRect(
//              borderRadius: BorderRadius.circular(5),
//              child: Container(
//                height: 60,
//                child: RaisedButton(
//                  onPressed: () {
//                    Navigator.pushNamed(context, 'startPage');
//                  },
//                  color: Colors.deepPurple[900],
//                  child: Text(
//                    'SIGN IN',
//                    style: TextStyle(
//                        color: Colors.white,
//                        fontWeight: FontWeight.bold,
//                        fontSize: 20),
//                  ),
//                ),
//              ),
//            ),
//          ),
//          SizedBox(
//            height: 20,
//          ),
//          InkWell(
//            onTap: () {
//              Navigator.pushNamed(context, 'homePage');
//            },
//            child: Center(
//              child: RichText(
//                text: TextSpan(
//                    text: 'Don\'t have an account?',
//                    style: TextStyle(color: Colors.black),
//                    children: [
//                      TextSpan(
//                        text: 'SIGN UP',
//                        style: TextStyle(
//                            color: Colors.deepPurple[900],
//                            fontWeight: FontWeight.bold),
//                      )
//                    ]),
//              ),
//            ),
//          )
//        ],
//      ),
//    );
//  }
//}
