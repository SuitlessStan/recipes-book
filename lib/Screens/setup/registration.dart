import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import '../../logistics/signingoogle.dart';
import '../home.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import '../../customs/custom_widgets.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final format = DateFormat("yyyy-MM-dd");
  String _name;
  String _email;
  String _password;
  String _temp;
  DateTime _dateTime;
  bool isDateSelected = false;
  String birthDateInString;

  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/registration.jpg"),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            margin: EdgeInsets.all(20),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  SpacingHV(30, 0),
                  nameField(),
                  SpacingHV(10, 0),
                  emailField(),
                  SpacingHV(10, 0),
                  passwordField(),
                  SpacingHV(10, 0),
                  passwordConfirmField(),
                  SpacingHV(10, 0),
                  Container(),
                  SpacingHV(10, 0),
                  _signInButton(),
                ],
              ),
            ),
          ),
        ));
  }

  Widget SpacingHV(double height, double width) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  Widget registerButton() {
    return RaisedButton(
      child: Text("Register"),
      onPressed: () {},
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.white54,
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return Home();
                },
              ),
            );
          }
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.white54),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage("assets/images/google_logo.png"),
              height: 35.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white70,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
