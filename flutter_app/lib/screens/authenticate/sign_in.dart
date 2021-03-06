import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String pass = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title: Text('Sign in'),
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.person),
              label: Text('Register'),
              onPressed: () {
                widget.toggleView();
              },
            )
          ],
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                    validator: (value) =>
                        value.isEmpty ? 'Enter a email' : null,
                    onChanged: (value) {
                      setState(() => email = value);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                      obscureText: true,
                      validator: (value) => value.length < 6
                          ? 'Enter a password 6 + chars'
                          : null,
                      onChanged: (value) {
                        setState(() => pass = value);
                      }),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    child: Text(
                      'Sign in',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formkey.currentState.validate()) {
                        dynamic result =
                            await _auth.signInWithEmailAndPassword(email, pass);
                        if (result == null) {
                          setState(() => error = 'COULD NOT SIGN');
                        }
                      }
                    },
                  )
                ],
              ),
            )));
  }
}
