import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Home Screen',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        elevation: 0,
      ),
      body: Column(
        children: const [
          Center(
            child: Text(
              'Welcome To Home Screen ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
