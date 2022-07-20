
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Email & Password Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: const Loginscreen(),
    );
  }
}
