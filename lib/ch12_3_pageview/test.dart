// 296p

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

void test() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  PageController controller =
      PageController(initialPage: 1, viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Hey',
          ),
        ),
        body: PageView(
          controller: controller,
          children: [
            Container(
              margin: const EdgeInsets.all(
                20,
              ),
              color: Colors.cyan,
              child: const Center(
                child: Text(
                  'First Page',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(
                20,
              ),
              color: Colors.yellow,
              child: const Center(
                child: Text(
                  'Second Page',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(
                20,
              ),
              color: Colors.orange,
              child: const Center(
                child: Text(
                  'Third Page',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
