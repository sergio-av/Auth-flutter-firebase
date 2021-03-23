import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth.dart';
class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: ElevatedButton(
          child: Text('Sign in anon'),
          onPressed: () async{
            dynamic result = await _auth.sigInAnon();
            if (result == null){
              print('error signing in');
            }else{
              print('Ha entrado');
              print(result);
            }
            //PATH="$PATH":"$HOME/snap/flutter/common/flutter/.pub-cache/bin"
          }
        ),
      )
    );
  }
}
