// 393p

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'test.g.dart';

void test() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

@JsonSerializable()
class Location {
  String? latitude;
  String? longitude;

  Location(this.latitude, this.longitude);
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Todo {
  @JsonKey(name: "id")
  int? todoId;
  String? title;
  bool? completed;

  Location? location;
  Todo(this.todoId, this.title, this.completed, this.location);
  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
  Map<String, dynamic> toJson() => _$TodoToJson(this);
}

class _MyAppState extends State<MyApp> {
  String jsonStr = '''
    {
      "id": 1,
      "title": "Hey",
      "completed": false,
      "location": {"latitude": "38", "longitude": "128"}
    }
  ''';
  Todo? todo;
  String result = '';

  void onPressDecode() {
    Map<String, dynamic> map = jsonDecode(jsonStr);
    todo = Todo.fromJson(map);

    // ignore: avoid_print
    print(todo?.toJson());
    setState(() {
      result = "decode: ${todo?.toJson()}";
    });
  }

  void onPressEncode() {
    setState(() {
      result = "encode: ${jsonEncode(todo?.toJson())}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Aquaman'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: onPressDecode,
                child: const Text('Decode'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: onPressEncode,
                child: const Text('Encode'),
              ),
              const SizedBox(height: 20),
              Text(result),
            ],
          ),
        ),
      ),
    );
  }
}
