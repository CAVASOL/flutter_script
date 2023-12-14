// 323p

import 'package:flutter/material.dart';

void test() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  List<Widget> getWidgets() {
    List<Widget> widgets = [];
    for (var i = 0; i < 100; i++) {
      widgets.add(
        const ListTile(
          title: Text(
            'Hey, Stranger.',
          ),
        ),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(
            20,
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: getWidgets(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
