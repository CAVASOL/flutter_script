// 258p

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
          backgroundColor: Colors.black,
          title: const Text('Hey'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: Row(
                  children: <Widget>[
                    Container(
                      color: Colors.red,
                      width: 100,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.amber,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.yellow,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.green,
                height: 300,
                child: Row(
                  children: [
                    Image.asset(
                      'images/icon/palm-tree.png',
                      width: 30,
                      height: 30,
                    ),
                    Image.asset(
                      'images/icon/palm-tree.png',
                      width: 30,
                      height: 30,
                    ),
                    Image.asset(
                      'images/icon/palm-tree.png',
                      width: 30,
                      height: 30,
                    ),
                    const Spacer(),
                    Image.asset(
                      'images/icon/palm-tree.png',
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.blue,
                height: 300,
              )
            ],
          ),
        ),
      ),
    );
  }
}
