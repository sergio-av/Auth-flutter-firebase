import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/screens/wrappe.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  // Para conseguir arrancar hay que iniciar primero firebase
  //===========================================
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //===========================================
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: missing_required_param
    return StreamProvider<UserP>.value(
        value: AuthService().user,
        child: MaterialApp(
          home: Wrapper(),
        ));
  }
}
