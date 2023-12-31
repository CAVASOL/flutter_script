// 314p

import 'package:flutter/material.dart';

void test() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.cyanAccent,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hey'),
        ),
        body: Container(
          margin: const EdgeInsets.all(
            20,
          ),
          child: Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Sup?',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Click',
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
