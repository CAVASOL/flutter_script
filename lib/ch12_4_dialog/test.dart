// 306p

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
            'Hey',
          ),
        ),
        body: const TestScreen(),
      ),
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  TextState createState() => TextState();
}

class TextState extends State<TestScreen> {
  DateTime dateValue = DateTime.now();
  TimeOfDay timeValue = TimeOfDay.now();

  _dialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Dialog'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  const Text('Opt-in'),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Okay'),
            ),
          ],
        );
      },
    );
  }

  _bottomSheet() {
    showBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text('Add'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.remove),
                title: const Text('Remove'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  _modalBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.yellow,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text('Add'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.remove),
                title: const Text('Remove'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        );
      },
    );
  }

  Future datePicker() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) setState(() => dateValue = picked);
  }

  Future timePicker() async {
    TimeOfDay? selectedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );
    if (selectedTime != null) setState(() => timeValue = selectedTime);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: _dialog, child: const Text('Dialog')),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: _bottomSheet, child: const Text('Bottom Sheet')),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: _modalBottomSheet,
              child: const Text('Modal Bottom Sheet')),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: datePicker, child: const Text('Date Picker')),
          const SizedBox(
            height: 20,
          ),
          Text('Date: ${DateFormat('dd-MM-yyyy').format(dateValue)}'),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: timePicker, child: const Text('Time Picker')),
          const SizedBox(
            height: 20,
          ),
          Text('Time: ${timeValue.hour}:${timeValue.minute}'),
        ],
      ),
    );
  }
}
