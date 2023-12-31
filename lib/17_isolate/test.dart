// 459p

import 'dart:async';
import 'dart:isolate';
import 'package:flutter/material.dart';

void test() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

myIsolate(SendPort mainPort) {
  ReceivePort isoPort = ReceivePort();
  mainPort.send({'port': isoPort.sendPort});

  isoPort.listen((message) {
    if (message['msg'] != 'Bye') {
      int count = message['msg'];
      mainPort.send({'msg': count * count});
    } else {
      isoPort.close();
    }
  });
}

class _MyAppState extends State<MyApp> {
  String result = '';

  void onPress() async {
    ReceivePort mainPort = ReceivePort();
    await Isolate.spawn(myIsolate, mainPort.sendPort);

    SendPort? isoPort;
    mainPort.listen((message) {
      if (message['port'] != null) {
        isoPort = message['port'];
      } else if (message['msg'] != null) {
        setState(() {
          result = 'msg: ${message['msg']}';
        });
      }
    });

    int count = 0;

    Timer.periodic(const Duration(seconds: 1), (timer) {
      count++;
      if (count < 6) {
        isoPort?.send({'msg': count});
      } else {
        isoPort?.send({'msg': 'Bye'});
        mainPort.close();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Aquaman',
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: onPress,
                child: const Text(
                  'test',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                result,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
