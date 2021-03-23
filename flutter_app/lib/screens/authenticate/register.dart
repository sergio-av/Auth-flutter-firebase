import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
//
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
          title: Text('Register'),
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sing In'),
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
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formkey.currentState.validate()) {
                          dynamic result = await _auth
                              .registerWithEmailAndPassword(email, pass);
                          if (result == null) {
                            setState(
                                () => error = 'Please insert a valid email');
                          }
                        }
                      })
                ],
              ),
            )));
  }
}
