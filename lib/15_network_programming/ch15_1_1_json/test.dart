// 387p

import 'dart:convert';

import 'package:flutter/material.dart';

void test() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class Todo {
  int id;
  String title;
  bool completed;

  Todo(this.id, this.title, this.completed);

  Todo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        completed = json['completed'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'completed': completed};
}

class _MyAppState extends State<MyApp> {
  String jsonStr = '{"id": 1, "title": "Hey", "completed": false}';
  Todo? todo;
  String result = '';

  onPressDecode() {
    Map<String, dynamic> map = jsonDecode(jsonStr);
    todo = Todo.fromJson(map);
    setState(
      () {
        result =
            "decode: id: ${todo?.id}, title: ${todo?.title}, comoleted: ${todo?.completed}";
      },
    );
  }

  onPressEncode() {
    setState(
      () {
        result = "encode: ${jsonEncode(todo)}";
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Aquamen',
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                result,
              ),
              ElevatedButton(
                onPressed: onPressDecode,
                child: const Text(
                  'Decode',
                ),
              ),
              ElevatedButton(
                onPressed: onPressEncode,
                child: const Text(
                  'Encode',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
