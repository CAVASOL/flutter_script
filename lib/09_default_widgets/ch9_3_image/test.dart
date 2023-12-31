// 205p

import 'package:flutter/material.dart';

void test() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Hi',
          ),
        ),
        body: Column(
          children: [
            Image.asset(
              'images/island.png',
              width: 160,
              height: 160,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.deepOrange,
              child: Image.asset(
                'images/icon/palm-tree.png',
                width: 160,
                height: 160,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
