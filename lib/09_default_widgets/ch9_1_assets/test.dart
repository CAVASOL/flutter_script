// 192p

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void test() {
  runApp(const StarWarsTxt());
}

class StarWarsTxt extends StatelessWidget {
  const StarWarsTxt({super.key});

  Future<String> useRootBundle() async {
    return await rootBundle.loadString('assets/text/EpisodeIV_dialogues.txt');
  }

  Future<String> useDefaultAssetBundle(BuildContext context) async {
    return await DefaultAssetBundle.of(context)
        .loadString('assets/text/EpisodeIV_dialogues.txt');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hey'),
        ),
        body: Column(
          children: [
            Image.asset(
              'images/island.png',
              width: 30,
              height: 30,
              fit: BoxFit.fill,
            ),
            Image.asset(
              'images/icon/palm-tree.png',
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
            FutureBuilder(
                future: useRootBundle(),
                builder: (context, snapshot) {
                  return Text('rootBundle: ${snapshot.data}');
                }),
            FutureBuilder(
                future: useDefaultAssetBundle(context),
                builder: (context, snapshot) {
                  return Text('DefaultAssetBundle: ${snapshot.data}');
                })
          ],
        ),
      ),
    );
  }
}
