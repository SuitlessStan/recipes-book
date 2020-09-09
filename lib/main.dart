import 'package:flutter/material.dart';
import 'package:recipes_book/Screens/setup/weclome.dart';
import 'screens/setup/signIn.dart';
import 'Screens/setup/weclome.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  final String loginTitle = "Something";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "firebase demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Weclome(),
    );
  }
}
