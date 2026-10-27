import 'package:flutter/material.dart';
import 'converter_screen.dart';
import 'history_screen.dart';
import 'about_screen.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Stage 4 — Navigation')),
    body: ListView(padding: const EdgeInsets.all(20), children: [
      const Text('Navigator.push opens a new route; Navigator.pop returns to the previous route.'),
      const SizedBox(height: 12),
      ListTile(leading: const Icon(Icons.swap_horiz), title: const Text('Open Converter'),
        trailing: const Icon(Icons.chevron_right), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ConverterScreen()))),
      ListTile(leading: const Icon(Icons.history), title: const Text('Open History'),
        trailing: const Icon(Icons.chevron_right), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HistoryScreen()))),
      ListTile(leading: const Icon(Icons.info_outline), title: const Text('Open About'),
        trailing: const Icon(Icons.chevron_right), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutScreen()))),
    ]),
  );
}
