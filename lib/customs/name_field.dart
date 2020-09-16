import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final Color fillColor;
  final Color hoverColor;
  final Color hintColor;
  final String labelText;
  final String hintText;
  final Function onChanged;
  final TextEditingController controller;
  final double hintFontSize;
  final double fontSize;
  final Color color;
  final Function onSaved;
  final Function onTap;
  final TextInputType keyboardType;

  const CustomField({
    Key key,
    this.fillColor,
    this.hoverColor,
    this.labelText,
    this.hintText,
    this.hintColor,
    this.onChanged,
    this.controller,
    this.hintFontSize,
    this.fontSize,
    this.color,
    this.onSaved,
    this.onTap,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      onSaved: onSaved,
      onTap: onTap,
      decoration: InputDecoration(
          fillColor: fillColor,
          filled: true,
          hoverColor: hoverColor,
          //Label properties
          labelText: labelText,
          labelStyle: TextStyle(
            color: color,
            fontSize: fontSize,
          ),

          //Hint properties
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintColor,
            fontSize: fontSize,
          )),
      keyboardType: keyboardType,
    );
  }
}
