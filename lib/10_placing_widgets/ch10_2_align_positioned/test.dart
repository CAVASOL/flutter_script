// 244p

import 'package:flutter/material.dart';

void test() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Hey'),
        ),
        body: Stack(
          children: [
            Align(
              alignment: const Alignment(0.0, 0.0),
              child: Container(
                width: 150,
                height: 150,
                color: Colors.yellow,
              ),
            ),
            Align(
              alignment: const FractionalOffset(1.0, 0.0),
              child: Container(
                width: 150,
                height: 150,
                color: Colors.blue,
              ),
            ),
            Positioned(
              left: 40.0,
              top: 40.0,
              child: Container(
                color: Colors.pink,
                height: 150.0,
                width: 150,
              ),
            )
          ],
        ),
      ),
    );
  }
}
