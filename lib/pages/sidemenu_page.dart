import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:ur_notes/services/auth_service.dart';

import 'init.dart';
import 'login.dart';

class SideMenuPage extends StatefulWidget {
  @override
  _SideMenuPageState createState() => _SideMenuPageState();
}

class _SideMenuPageState extends State<SideMenuPage> {
  final user = FirebaseAuth.instance;
  AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: ListView(
              children: [header()],
            )));
  }

  Widget header() {
    return Container(
        height: 250,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
              accountName: Text('User'),
              accountEmail: Text(user.currentUser.email),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.black,
                child: Text(
                  'O',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            ),
            IconButton(icon: Icon(Icons.logout),
                color: Colors.grey,
                onPressed: () {
                  auth.singOut();

                  Toast.show("singOut exitoso!", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OpeningView()),
                  );
                }
            )
          ],
        ));
  }
}
