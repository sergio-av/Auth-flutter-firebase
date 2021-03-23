import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/wrappe.dart';

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
    return MaterialApp(
      home: Wrapper(),
    );
  }
}
