import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class Customs {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final format = DateFormat("yyyy-MM-dd");
  String _name;
  String _email;
  String _password;
  String _temp;
  DateTime _dateTime;
  bool isDateSelected = false;
  String birthDateInString;
  Widget nameField() {
    return TextFormField(
      decoration: InputDecoration(
          fillColor: Colors.white54,
          filled: true,
          hoverColor: Colors.white54,
          //Label properties
          labelText: "Enter name",
          labelStyle: TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
          //Hint properties
          hintText: "Enter name",
          hintStyle: TextStyle(
            color: Colors.white54,
            fontSize: 13,
          )),
      keyboardType: TextInputType.name,
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Enter email",
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
        hintText: "Enter email",
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white54,
        filled: true,
        hoverColor: Colors.white54,
        //Password properties
        labelText: "Enter Password",
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
        //Hint properties
        hintText: "Enter Password",
        hintStyle: TextStyle(
          color: Colors.white54,
          fontSize: 13,
        ),
      ),
      obscureText: true,
    );
  }

  Widget passwordConfirmField() {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white54,
        filled: true,
        hoverColor: Colors.white54,
        //Password properties
        labelText: "Confirm Password",
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
        //Hint properties
        hintText: "Confirm Password",
        hintStyle: TextStyle(
          color: Colors.white54,
          fontSize: 13,
        ),
      ),
      obscureText: true,
    );
  }
}
