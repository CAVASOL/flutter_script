// 443p

import 'dart:async';
import 'package:flutter/material.dart';

void test() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({Key? key});

  subscriptionTest() {
    var stream = Stream.fromIterable([1, 2, 3]);
    StreamSubscription subscription = stream.listen(null);

    subscription.onData((data) {
      // ignore: avoid_print
      print('value: $data');
    });
    subscription.onError((error) {
      // ignore: avoid_print
      print('error: $error');
    });
    subscription.onDone(() {
      // ignore: avoid_print
      print('Stream done!');
    });
  }

  controllerTest() {
    var controller = StreamController();

    var stream1 = Stream.fromIterable([1, 2, 3]);
    var stream2 = Stream.fromIterable(['A', 'B', 'C']);

    stream1.listen((value) {
      controller.add(value);
    });
    stream2.listen((value) {
      controller.add(value);
    });

    controller.stream.listen((value) {
      // ignore: avoid_print
      print('$value');
    });
  }

  transformerTest() {
    // ignore: unused_local_variable
    var stream = Stream.fromIterable([1, 2, 3]);

    StreamTransformer<int, dynamic> transformer =
        StreamTransformer.fromHandlers(handleData: (value, sink) {
      // ignore: avoid_print
      print('in transformer... $value');
      sink.add(value * value);
    });

    stream.transform(transformer).listen((value) {
      // ignore: avoid_print
      print('in listen... $value');
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
                onPressed: subscriptionTest,
                child: const Text(
                  'Subscription',
                ),
              ),
              ElevatedButton(
                onPressed: controllerTest,
                child: const Text(
                  'Controller',
                ),
              ),
              ElevatedButton(
                onPressed: transformerTest,
                child: const Text(
                  'Transformer',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
