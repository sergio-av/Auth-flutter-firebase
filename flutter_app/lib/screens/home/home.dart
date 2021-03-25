import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Home Prueba'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      body: Container(
        child: Row(
          children: [
            TextButton(
                child: Text('Hacer Peticion'),
                onPressed: () {
                  _auth.doPeticion();
                }),
            TextButton(
              child: Text('Obtener Token'),
              onPressed: () {
                _auth.fetchToken();
              },
            )
          ],
        ),
      ),
    );
  }
}
