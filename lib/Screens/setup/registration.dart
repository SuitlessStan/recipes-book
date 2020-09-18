import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recipes_book/customs/name_field.dart';
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
  String _temp;

  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/registration.jpg"),
                    fit: BoxFit.cover)),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                margin: EdgeInsets.all(20),
                child: Form(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
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
                        SizedBox(height: 20),
                        CustomTextField(
                          //Name field
                          //Label
                          labelText: "Enter name",
                          //Hint
                          hintText: "Enter name",
                        ),
                        CustomTextField(
                          //Password field
                          //Label
                          labelText: "Enter password",
                          //Hint
                          hintText: "Enter password",
                        ),
                        CustomTextField(
                          //Confirm password field
                          //Label
                          labelText: "Confirm password",
                          //Hint
                          hintText: "Confirm password",
                        ),
                        CustomTextField(
                          //Select date of birth
                          //Label
                          labelText: "Date of birth",
                          //Hint
                          hintText: "Date of birth",
                        ),
                        CustomTextField(
                          //Email field
                          //Label
                          labelText: "Enter email",
                          //Hint
                          hintText: "Enter email",
                        ),
                        _signInButton(),
                      ],
                    ),
                  ),
                ),
              ),
            )));
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

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final Function onSaved;
  final Function onTap;
  final Function onChanged;

  const CustomTextField({
    Key key,
    this.hintText,
    this.labelText,
    this.onSaved,
    this.onTap,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //Name field
      onSaved: (String savedSubmit) {},
      decoration: InputDecoration(
        //rounded Textfield
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        //Textfield color
        fillColor: Colors.white24,
        filled: true,
        //Label
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.white60,
          fontSize: 14,
        ),
        //Hint
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white60,
          fontSize: 14,
        ),
      ),
    );
  }
}
