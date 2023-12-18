import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void test() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = '';

  Future<void> dioTest() async {
    try {
      var dio = Dio(
        BaseOptions(
          baseUrl: "https://reqres.in/api/",
          connectTimeout: const Duration(milliseconds: 5000),
          receiveTimeout: const Duration(milliseconds: 5000),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
      );

      List<Response<dynamic>> response = await Future.wait([
        dio.get('users?page=1'),
        dio.get('users?page=2') // corrected URL
      ]);

      // Collecting data from all responses
      StringBuffer stringBuffer = StringBuffer();
      for (var element in response) {
        if (element.statusCode == 200) {
          stringBuffer.writeln(element.data.toString());
        }
      }

      setState(() {
        result = stringBuffer.toString();
      });
    } catch (e) {
      setState(() {
        result = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dio Test',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: dioTest,
              child: const Text(
                'Get Server Data',
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  result,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
