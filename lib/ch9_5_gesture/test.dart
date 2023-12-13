import 'package:flutter/material.dart';

void test() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hey, Stranger.'),
        ),
        body: Column(
          children: [
            GestureDetector(
              child: Image.asset(
                'images/icon/palm-tree.png',
              ),
              onTap: () {
                print('Click this');
              },
              onVerticalDragStart: (DragStartDetails details) {
                print('vertical drag start ... global position:'
                    '${details.globalPosition.dx},'
                    '${details.globalPosition.dy}');
                print('vertical drag start ... local position:'
                    '${details.localPosition.dx},'
                    '${details.localPosition.dy}');
              },
            ),
            ElevatedButton(
              onPressed: () {
                print('ElevatedButton Click');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: const Text('Click here'),
            ),
          ],
        ),
      ),
    );
  }
}
