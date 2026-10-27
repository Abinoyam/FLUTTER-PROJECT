import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/conversion_provider.dart';

class StateManagementScreen extends StatelessWidget {
  const StateManagementScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConversionProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Stage 5 — State Management')),
      body: Padding(padding: const EdgeInsets.all(20), child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('This page reads shared state from ConversionProvider using Provider.'),
          const SizedBox(height: 12),
          Text('Conversions in session: ${provider.history.length}', style: Theme.of(context).textTheme.headlineSmall),
          Text('Latest result: ${provider.lastResult ?? 'No conversion yet'}'),
          const SizedBox(height: 12),
          OutlinedButton(onPressed: provider.clearHistory, child: const Text('Clear conversion history')),
        ],
      )),
    );
  }
}
