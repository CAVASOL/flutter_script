// 482p

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void test() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Inherited Test',
          ),
        ),
        body: MyInheritedWidget(
          TestWidget(),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyInheritedWidget extends InheritedWidget {
  int count = 0;

  MyInheritedWidget(child, {super.key}) : super(child: child);

  increment() {
    count++;
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) => true;

  static MyInheritedWidget? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
}

class TestSubWidget extends StatelessWidget {
  const TestSubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int count = MyInheritedWidget.of(context)!.count;
    return Container(
      width: 200,
      height: 200,
      color: Colors.green,
      child: Center(
        child: Text(
          'Sub-widget: $count',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class TestWidget extends StatelessWidget {
  TestWidget({super.key}) {
    // ignore: avoid_print
    print('Test-widget contructor.');
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        MyInheritedWidget? widget = MyInheritedWidget.of(context);
        int counter = MyInheritedWidget.of(context)!.count;

        Function increment = MyInheritedWidget.of(context)!.increment;
        return Center(
          child: Container(
            color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Test-widget: $counter',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => increment()),
                  child: const Text(
                    'increment()',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() => widget!.count++);
                  },
                  child: const Text(
                    'count++',
                  ),
                ),
                TestSubWidget()
              ],
            ),
          ),
        );
      },
    );
  }
}
