import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  @override
  Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(24), children: const [
    Icon(Icons.swap_horizontal_circle, size: 64),
    SizedBox(height: 12),
    Text('Unit Converter Flutter Project', textAlign: TextAlign.center,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    SizedBox(height: 12),
    Text('UI Design Using Flutter Lab (CS506PC)', textAlign: TextAlign.center),
    SizedBox(height: 20),
    Text('Student: Abinoyam'),
    Text('Branch: Computer Science and Engineering'),
    Text('Year: III B.Tech'),
    Text('College: ACE Engineering College'),
    SizedBox(height: 20),
    Text('This application combines all ten lab topics in a single Flutter project.'),
  ]);
}
