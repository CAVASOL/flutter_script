// 348p
// 357p

import 'package:flutter/material.dart';
import 'package:flutter_script/14_navigation/ch14_1_navigation/first_screen.dart';
import 'package:flutter_script/14_navigation/ch14_1_navigation/fourth_screen.dart';
import 'package:flutter_script/14_navigation/ch14_1_navigation/second_screen.dart';
import 'package:flutter_script/14_navigation/ch14_1_navigation/third_screen.dart';

void test() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/first',
      routes: {
        '/first': (context) => const FirstScreen(),
        '/second': (context) => const SecondScreen(),
        '/third': (context) => const ThirdScreen(),
        '/fourth': (context) => const FourthScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/third') {
          return MaterialPageRoute(
            builder: (context) => const ThirdScreen(),
            settings: settings,
          );
        } else if (settings.name == '/fourth') {
          return MaterialPageRoute(
            builder: (constxt) => const FourthScreen(),
            settings: settings,
          );
        }
        return null;
      },
    );
  }
}
