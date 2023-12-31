// 436p

import 'dart:async';
import 'package:flutter/material.dart';

void test() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({Key? key});

  int calFun(int x) {
    return x * x;
  }

  Stream<int> test() {
    Duration duration = const Duration(seconds: 3);
    Stream<int> stream = Stream<int>.periodic(duration, calFun);
    return stream.take(5);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Aquaman',
          ),
        ),
        body: Center(
          child: StreamBuilder(
            stream: test(),
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return const Center(
                  child: Text(
                    'Completed',
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: CircularProgressIndicator(),
                      ),
                      Text(
                        'Waiting',
                        style: TextStyle(
                          fontSize: 32,
                        ),
                      )
                    ],
                  ),
                );
              }
              return Center(
                child: Text(
                  '{$snapshot.data}',
                  style: const TextStyle(
                    fontSize: 32,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
