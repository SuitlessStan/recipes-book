import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../home.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginPage extends StatefulWidget {
  final String title = "";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log in"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return "Please enter a valid email";
                  }
                },
                onSaved: (input) => _email = input,
                keyboardType: TextInputType.emailAddress,
                decoration:
                    InputDecoration(labelText: "Email", hintText: "Email"),
              ),
              Spacing(20),
              TextFormField(
                validator: (input) {
                  if (input.isEmpty || input.length < 6) {
                    return "Please enter a valid password";
                  }
                },
                onSaved: (input) => _password = input,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Password",
                ),
              ),
              Spacing(10),
              RaisedButton(
                onPressed: signIn,
                child: Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget Spacing(double height) {
    return SizedBox(
      height: height,
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        await Firebase.initializeApp();
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
