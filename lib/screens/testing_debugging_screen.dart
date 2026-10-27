import 'package:flutter/material.dart';
import '../utils/conversion_utils.dart';

class TestingDebuggingScreen extends StatefulWidget {
  const TestingDebuggingScreen({super.key});
  @override
  State<TestingDebuggingScreen> createState() => _TestingDebuggingScreenState();
}

class _TestingDebuggingScreenState extends State<TestingDebuggingScreen> {
  String result = 'No checks have run yet.';
  int runs = 0;

  void runChecks() {
    final length = ConversionUtils.convert(1000, 'Length', 'Meters', 'Kilometers');
    final temperature = ConversionUtils.convert(0, 'Temperature', 'Celsius', 'Fahrenheit');
    final passed = (length - 1).abs() < 0.000001 && (temperature - 32).abs() < 0.000001;
    setState(() {
      runs++;
      result = '${passed ? 'PASS' : 'FAIL'}: 1000 m = ${ConversionUtils.format(length)} km; '
          '0°C = ${ConversionUtils.format(temperature)}°F. Run #$runs';
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Stage 10 — Testing & Debugging')),
    body: Padding(padding: const EdgeInsets.all(20), child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Conversion diagnostics', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 12),
        const Text('Checks expected results for length and temperature conversions.'),
        const SizedBox(height: 16),
        FilledButton(onPressed: runChecks, child: const Text('Run checks')),
        const SizedBox(height: 16),
        Card(child: Padding(padding: const EdgeInsets.all(16), child: Text(result))),
      ],
    )),
  );
}
