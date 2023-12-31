// 209p

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void test() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void onChange() {
    // ignore: avoid_print
    print('Sup?');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hey, Stranger.'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.help_outline_outlined,
              size: 100,
              color: Colors.deepOrangeAccent,
            ),
            const SizedBox(height: 20),
            const FaIcon(
              FontAwesomeIcons.bell,
              size: 100,
            ),
            const SizedBox(height: 20),
            IconButton(
              onPressed: onChange,
              icon: const Icon(
                Icons.chat_bubble_outline,
                size: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
