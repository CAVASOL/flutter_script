// 186p

import 'package:flutter/material.dart';

void test() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyListWidget());
  }
}

class MyListWidget extends StatefulWidget {
  const MyListWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyListWidgetState();
  }
}

class _MyListWidgetState extends State<MyListWidget> {
  List<Widget> widgetList = [
    MyColorItemWidget(
      Colors.amber,
      key: UniqueKey(),
    ),
    MyColorItemWidget(
      Colors.cyan,
      key: UniqueKey(),
    ),
  ];

  onChange() {
    setState(() {
      widgetList.insert(1, widgetList.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Key Test'),
      ),
      body: Column(
        children: [
          Row(
            children: widgetList,
          ),
          ElevatedButton(
            onPressed: onChange,
            child: const Text('Toggle'),
          )
        ],
      ),
    );
  }
}

class MyColorItemWidget extends StatefulWidget {
  final Color color;

  const MyColorItemWidget(this.color, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyColorItemWidgetState();
  }
}

class _MyColorItemWidgetState extends State<MyColorItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: widget.color,
        width: 150,
        height: 150,
      ),
    );
  }
}
