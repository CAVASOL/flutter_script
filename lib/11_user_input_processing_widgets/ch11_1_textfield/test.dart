// 269p

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
        body: const TestScreen(),
      ),
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  TextState createState() => TextState();
}

class TextState extends State<TestScreen> {
  final controller = TextEditingController();
  int textCounter = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(_printValue);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _printValue() {
    print("_printValue(): ${controller.text}");
    setState(() {
      textCounter = controller.text.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build...');
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(
            16,
          ),
          child: TextField(
            style: const TextStyle(
              fontSize: 16,
            ),
            controller: controller,
            decoration: InputDecoration(
              labelText: 'Data',
              prefixIcon: const Icon(Icons.input),
              border: const OutlineInputBorder(),
              hintText: "Say something!",
              counterText: "$textCounter characters",
            ),
            textInputAction: TextInputAction.search,
            keyboardType: TextInputType.emailAddress,
            minLines: 5,
            maxLines: 5,
          ),
        ),
      ],
    );
  }
}
