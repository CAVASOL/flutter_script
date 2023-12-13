// 275p

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
  bool? isChecked = true;
  String? selectPlatform;
  double sliderValue = 5.0;
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Ckeckbox'),
        Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {});
                isChecked = value;
              },
            ),
            Text('checkbox value is $isChecked')
          ],
        ),
        const Text('Radio Button'),
        Row(
          children: [
            Radio(
              value: "android",
              groupValue: selectPlatform,
              onChanged: (String? value) {
                setState(() {});
                selectPlatform = value;
              },
            ),
            const Text('android')
          ],
        ),
        Row(
          children: [
            Radio(
              value: 'ios',
              groupValue: selectPlatform,
              onChanged: (String? value) {
                setState(() {});
                selectPlatform = value;
              },
            ),
            const Text('ios')
          ],
        ),
        Text('select platform is $selectPlatform'),
        const Text('Slider Bar'),
        Slider(
          value: sliderValue,
          min: 0,
          max: 10,
          onChanged: (double value) {
            setState(() {});
            sliderValue = value;
          },
        ),
        Text('slider value is $sliderValue'),
        const Text('Switch'),
        Switch(
          value: switchValue,
          onChanged: (bool value) {
            setState(() {});
            switchValue = value;
          },
        ),
        Text('select value is $switchValue')
      ],
    );
  }
}
