// 346p
// 356p

import 'package:flutter/material.dart';
import 'package:flutter_script/14_navigation/ch14_1_navigation/user.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Second'),
      ),
      body: Container(
        color: Colors.cyan,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Second',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              Text(
                  'sendData: ${args["arg1"]}, ${args["arg2"]}, ${(args["arg3"] as User).name}'),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/third');
                },
                child: const Text('Go Third'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    User('Lizzy', 'Texas'),
                  );
                },
                child: const Text('Go First'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
