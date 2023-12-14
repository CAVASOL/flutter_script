// 320p

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

void test() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget platformUI() {
    if (Platform.isIOS) {
      return CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: const CupertinoThemeData(
          brightness: Brightness.light,
        ),
        home: CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(
            middle: Text(
              'Hey, Stranger.',
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                child: const Text(
                  'Click',
                ),
                onPressed: () {},
              ),
              const Center(
                child: Text(
                  'How are you?',
                ),
              )
            ],
          ),
        ),
      );
    } else if (Platform.isAndroid) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Hey',
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Click',
                ),
              ),
              const Center(
                child: Text(
                  'How are you?',
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return const Text(
        'Sup?',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return platformUI();
  }
}
