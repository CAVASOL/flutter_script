// 336p

import 'package:flutter/material.dart';

void test() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> getWidgets() {
    List<Widget> widgets = [];
    for (var i = 0; i < 100; i++) {
      widgets.add(
        ListTile(
          title: Text('Hey, $i'),
        ),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.expand,
                ),
              ),
              expandedHeight: 200,
              floating: true,
              pinned: false,
              snap: true,
              elevation: 50,
              backgroundColor: Colors.pink,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'images/mo.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              title: const Text('Hey'),
              actions: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_alert,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.phone,
                  ),
                )
              ],
            ),
            SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return const ListTile(
                    title: Text('Heyo, Stranger.'),
                  );
                },
              ),
              itemExtent: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
