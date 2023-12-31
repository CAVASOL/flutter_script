// 199p

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

void test() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String longTxt =
      'Tumble out of bed And stumble to the kitchen Pour myself a cup of ambition And yawn and stretch and try to come to life Jump in the shower And the blood starts pumping Out on the streets, the traffic starts jumping For folks like me on the job from 9 to 5 Working 9 to 5 What a way to make a living Barely getting by It is all taking and no giving They just use your mind And they never give you credit It is enough to drive you Crazy if you let it';

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Hey',
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '9 to 5',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.deepPurple,
                fontSize: 24,
                backgroundColor: Colors.amber,
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
                decorationStyle: TextDecorationStyle.wavy,
              ),
            ),
            Text(
              longTxt,
              style: const TextStyle(
                fontSize: 20,
              ),
              maxLines: 10,
              overflow: TextOverflow.fade,
            ),
            RichText(
              text: const TextSpan(
                text: 'ambition',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.brown,
                ),
                children: [
                  TextSpan(
                    text: '9',
                    style: TextStyle(fontStyle: FontStyle.italic),
                    children: [
                      TextSpan(text: 'to'),
                      TextSpan(
                        text: 'crazy',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  TextSpan(
                    text: '5',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
