import 'package:flutter/material.dart';
import 'Cart.dart';
import 'UserAccountPage.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text(
              'John Kasper',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            decoration: BoxDecoration(color: Colors.deepPurple[900]),
            accountEmail: Text('jhonkasper@wiz.com'),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                child: Container(
                  width: 70,
                  height: 70,
//                  color: Colors.deepPurple[900],
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      image: DecorationImage(
                          image: AssetImage('assets/john.jpg'),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.deepPurple[900]),
            onTap: () {
              Navigator.pop(context);
            },
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            leading:
                Icon(Icons.supervisor_account, color: Colors.deepPurple[900]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyAccount()),
              );

            },
            title: Text(
              'My account',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.category, color: Colors.deepPurple[900]),
            onTap: () {
              Navigator.pop(context);

            },
            title: Text(
              'Categories',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.deepPurple[900],
            ),
            onTap: () {
              Navigator.pop(context);

            },
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.deepPurple[900],
            ),
            onTap: () {
              Navigator.pop(context);

            },
            title: Text(
              'About',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
