import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';
import 'package:ur_notes/pages/login.dart';
import 'package:ur_notes/services/auth_service.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Image.asset("assets/images/splash.jpeg",
                  height: MediaQuery.of(context).size.height / 6),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                '¡Regístrate!',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                textScaleFactor: 2.5,
                style: TextStyle(color: Colors.black.withOpacity(0.5)),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(1),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    hintText: "something@example.com",
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                )),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                obscureText: true,
                controller: _passwordController,
                style: TextStyle(
                  color: Colors.black,
                ),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  hintText: "password",
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width / 1.2,
                  padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                  child: Text(
                    "Registrar",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    AuthService auth = AuthService();
                    UserCredential user = await auth.register(_emailController.text.trim(), _passwordController.text.trim(),);
                    if(user != null){
                      Toast.show("Registro exitoso!", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    } else{
                      Toast.show("Error", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}