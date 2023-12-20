// 419p

import 'dart:async';
import 'package:flutter/material.dart';

void test() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({Key? key});

  Future<int> sum() async {
    var sum = 0;
    for (int i = 0; i < 500000000; i++) {
      sum += i;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Aquaman'),
        ),
        body: FutureBuilder<int>(
          future: sum(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 24,
                  ),
                ),
              );
            } else if (snapshot.hasData) {
              return Center(
                child: Text(
                  '${snapshot.data}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                  ),
                ),
              );
            } else {
              return const Center(
                child: Text(
                  'Waiting',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
