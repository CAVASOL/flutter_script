// 309p

// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';

void test() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MyApp>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Hey',
          ),
          bottom: TabBar(
            controller: controller,
            tabs: const <Widget>[
              Tab(
                text: 'One',
              ),
              Tab(
                text: 'Two',
              ),
              Tab(
                text: 'Three',
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: const <Widget>[
            Center(
              child: Text(
                'One Screen',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                'Second Screen',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                'Third Screen',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
