import 'package:flutter/material.dart';

class AnimationsScreen extends StatefulWidget {
  const AnimationsScreen({super.key});
  @override
  State<AnimationsScreen> createState() => _AnimationsScreenState();
}

class _AnimationsScreenState extends State<AnimationsScreen> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Stage 8 — Animations')),
    body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      AnimatedContainer(
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeInOut,
        width: expanded ? 260 : 150,
        height: expanded ? 180 : 150,
        decoration: BoxDecoration(
          color: expanded ? Colors.deepPurple : Colors.indigo,
          borderRadius: BorderRadius.circular(expanded ? 28 : 100),
        ),
        child: const Icon(Icons.animation, color: Colors.white, size: 52),
      ),
      const SizedBox(height: 20),
      FilledButton(onPressed: () => setState(() => expanded = !expanded),
        child: Text(expanded ? 'Reverse animation' : 'Play animation')),
    ])),
  );
}
