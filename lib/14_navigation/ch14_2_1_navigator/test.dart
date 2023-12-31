// 367p

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

void test() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  bool isDeepLink = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aauaman",
      home: Navigator(
        pages: [
          const MaterialPage(child: FirstScreen()),
          if (isDeepLink) const MaterialPage(child: SecondScreen())
        ],
        onPopPage: (route, result) => route.didPop(result),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'First',
        ),
      ),
      body: Container(
        color: Colors.pinkAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'First Screen',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Back to Second Screen",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'First',
        ),
      ),
      body: Container(
        color: Colors.orangeAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Second Screen',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Go First',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
