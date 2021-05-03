import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:ur_notes/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ur_notes/pages/init.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final user = FirebaseAuth.instance;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if(user.currentUser != null){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OpeningView(),
      );
    }
  }
}