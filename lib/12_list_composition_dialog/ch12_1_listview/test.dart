// 289p

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

void test() {
  runApp(MyApp());
}

class User {
  String name;
  String phone;
  String email;
  User(this.name, this.phone, this.email);
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  List<User> users = [
    User('Lizzy', '001', 'a@a.com'),
    User('Mark', '002', 'b@b.com'),
    User('Donald', '003', 'c@c.com'),
    User('Sol', '008', 'n@n.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Hey',
          ),
        ),
        body: ListView.separated(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('images/darth.png'),
              ),
              title: Text(users[index].name),
              subtitle: Text(users[index].phone),
              trailing: const Icon(Icons.more_vert),
              onTap: () {
                print(users[index].name);
              },
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 2,
              color: Colors.black,
            );
          },
        ),
      ),
    );
  }
}
