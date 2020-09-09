import 'package:flutter/material.dart';
import 'package:recipes_book/Screens/setup/signIn.dart';
import 'registration.dart';

class Weclome extends StatefulWidget {
  @override
  _WeclomeState createState() => _WeclomeState();
}

class _WeclomeState extends State<Weclome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: navigateToRegister,
              child: Text("Register"),
            ),
            RaisedButton(
              onPressed: navigateToLoginIn,
              child: Text("Log in"),
            )
          ],
        ),
      ),
    );
  }

  void navigateToLoginIn() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
          fullscreenDialog: true,
        ));
  }

  void navigateToRegister() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegistrationPage(),
          fullscreenDialog: true,
        ));
  }
}
