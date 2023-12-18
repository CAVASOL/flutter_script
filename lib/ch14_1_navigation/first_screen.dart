// 347p
// 356p

import 'package:flutter/material.dart';
import 'package:flutter_script/ch14_1_navigation/user.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First'),
      ),
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'First',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.pushNamed(
                    context,
                    '/second',
                    arguments: {
                      "arg1": 32,
                      "arg2": "Male",
                      "arg3": User("Harry", "London")
                    },
                  );
                  if (result != null && result is User) {
                    print('Result: ${result.name}');
                  }
                },
                child: const Text('Go to second'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
