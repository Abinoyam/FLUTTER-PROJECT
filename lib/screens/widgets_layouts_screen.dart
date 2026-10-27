import 'package:flutter/material.dart';

class WidgetsLayoutsScreen extends StatelessWidget {
  const WidgetsLayoutsScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Stage 2 — Widgets & Layouts')),
    body: Padding(padding: const EdgeInsets.all(20), child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('Text, Icon, Card, buttons, Row and Column widgets.'),
        const SizedBox(height: 16),
        Card(child: const ListTile(leading: Icon(Icons.widgets), title: Text('A reusable card'), subtitle: Text('ListTile combines icon, title and subtitle.'))),
        Row(children: [
          Expanded(child: FilledButton(onPressed: () {}, child: const Text('Button A'))),
          const SizedBox(width: 12),
          Expanded(child: OutlinedButton(onPressed: () {}, child: const Text('Button B'))),
        ]),
        const SizedBox(height: 16),
        const Stack(alignment: Alignment.center, children: [
          SizedBox(height: 100, width: double.infinity, child: ColoredBox(color: Colors.indigo)),
          Text('Stack overlays widgets', style: TextStyle(color: Colors.white)),
        ]),
      ],
    )),
  );
}
