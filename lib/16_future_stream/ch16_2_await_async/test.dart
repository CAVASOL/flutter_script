// 425p

import 'dart:async';
import 'package:flutter/material.dart';

void test() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({Key? key});

  Future<int> funA() {
    return Future.delayed(const Duration(seconds: 3), () {
      return 10;
    });
  }

  Future<int> funB(int arg) {
    return Future.delayed(const Duration(seconds: 2), () {
      return arg * arg;
    });
  }

  Future<int> calFun() async {
    int aResult = await funA();
    int bResult = await funB(aResult);
    return bResult;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Aquaman'),
        ),
        body: Center(
          child: FutureBuilder<int>(
            future: calFun(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: CircularProgressIndicator(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Waiting...',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                      ),
                    ),
                  ],
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
              } else {
                return const Center(
                  child: Text(
                    'Waiting...',
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
      ),
    );
  }
}
