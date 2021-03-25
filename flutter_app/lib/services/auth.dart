import 'dart:io';

import 'package:flutter_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:http/http.dart' as http;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //User to Firebase_user
  // Al usar El User de firebase debemos de utilizar otro nombre para la class User
  UserP _userFromFirebaseUser(User user) {
    return user != null ? UserP(uid: user.uid) : null;
  }

  //auth change user
  Stream<UserP> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //Peticion
  void doPeticion() {
    var user = _auth.currentUser;
    Future<String> token = user.getIdToken();

    final url =
        'https://so0y5ln90d.execute-api.eu-central-1.amazonaws.com/authApi';
    final uri = Uri.parse(url);
    http.get(uri).then((res) {
      print(res.statusCode);
      print(user.email);
      print(token);
    });
  }

  //Obtener Token
  Future<http.Response> fetchToken() async {
    final user = _auth.currentUser;
    String token = await user.getIdToken();

    try {
      final response = await http.get(
          Uri.parse(
              'https://so0y5ln90d.execute-api.eu-central-1.amazonaws.com/authApi'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${token}'
          });
      print('Token : ${token}');
      print(response);
    } catch (e) {
      print(e);
    }
  }

  //sign in whit email
  Future signInWithEmailAndPassword(String email, String pass) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register
  Future registerWithEmailAndPassword(String email, String pass) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
