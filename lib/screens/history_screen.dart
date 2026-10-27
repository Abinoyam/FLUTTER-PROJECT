import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/conversion_provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConversionProvider>();
    final items = provider.history;
    if (items.isEmpty) return const Center(child: Text('No conversions yet. Open Convert and try one.'));
    return Column(children: [
      Align(alignment: Alignment.centerRight, child: TextButton.icon(
        onPressed: provider.clearHistory, icon: const Icon(Icons.delete_outline), label: const Text('Clear history'))),
      Expanded(child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            leading: const Icon(Icons.history),
            title: Text(items[index].displayText),
            subtitle: Text('${items[index].category} • ${items[index].createdAt.toLocal()}'),
          ),
        ),
      )),
    ]);
  }
}
