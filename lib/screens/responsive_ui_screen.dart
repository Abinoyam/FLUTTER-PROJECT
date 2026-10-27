import 'package:flutter/material.dart';

class ResponsiveUiScreen extends StatelessWidget {
  const ResponsiveUiScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Stage 3 — Responsive UI')),
    body: LayoutBuilder(builder: (context, constraints) {
      final compact = constraints.maxWidth < 600;
      return Padding(
        padding: EdgeInsets.all(compact ? 12 : 32),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Available width: ${constraints.maxWidth.toStringAsFixed(0)} px'),
          const SizedBox(height: 12),
          Text(compact ? 'Compact layout: one column' : 'Wide layout: room for a wider layout',
            style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Wrap(spacing: 12, runSpacing: 12, children: List.generate(4, (i) =>
            SizedBox(width: compact ? constraints.maxWidth - 24 : 180,
              child: Card(child: Padding(padding: const EdgeInsets.all(20), child: Text('Responsive item ${i + 1}'))))),
          ),
        ]),
      );
    }),
  );
}
