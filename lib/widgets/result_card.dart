import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final String result;
  final String unit;
  const ResultCard({super.key, required this.result, required this.unit});

  @override
  Widget build(BuildContext context) => AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [Color(0xFFE4F5FF), Color(0xFFE8E9FF)],
        begin: Alignment.topLeft, end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: const Color(0xFFD4E8FF)),
    ),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Row(children: [
        Icon(Icons.check_circle_rounded, color: Color(0xFF087CF0), size: 18),
        SizedBox(width: 7),
        Text('CONVERSION RESULT', style: TextStyle(fontSize: 11, letterSpacing: .8, fontWeight: FontWeight.w900, color: Color(0xFF34618B))),
      ]),
      const SizedBox(height: 10),
      Text(result, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Color(0xFF102A43))),
      const SizedBox(height: 3),
      Text(unit, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF34618B))),
    ]),
  );
}
