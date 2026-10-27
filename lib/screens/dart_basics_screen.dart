import 'package:flutter/material.dart';

class DartBasicsScreen extends StatelessWidget {
  const DartBasicsScreen({super.key});

  String describeBasics() {
    int count = 10;
    double value = 2.5;
    String language = 'Dart';
    bool isFlutter = true;
    final list = <int>[1, 2, 3];
    final doubled = list.map((n) => n * 2).toList();
    return 'int: $count\ndouble: $value\nString: $language\nbool: $isFlutter\nList: $list\nmap() result: $doubled';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Stage 1 — Dart Basics')),
    body: Padding(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Variables, data types, collections, functions and interpolation.'),
      const SizedBox(height: 16),
      SelectableText(describeBasics(), style: const TextStyle(fontFamily: 'monospace', height: 1.6)),
    ])),
  );
}
