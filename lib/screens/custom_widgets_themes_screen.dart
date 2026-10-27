import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class CustomWidgetsThemesScreen extends StatelessWidget {
  const CustomWidgetsThemesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Stage 6 — Custom Widgets & Themes')),
      body: Padding(padding: const EdgeInsets.all(20), child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('This stage demonstrates reusable components, Material 3 theme data and application-wide theme state.'),
          const SizedBox(height: 16),
          Card(child: const ListTile(
            leading: Icon(Icons.palette),
            title: Text('Custom themed card'),
            subtitle: Text('The card follows the active Material theme.'),
          )),
          const SizedBox(height: 16),
          SwitchListTile(
            title: const Text('Dark mode'),
            subtitle: Text(theme.isDark ? 'Dark theme is enabled' : 'Light theme is enabled'),
            value: theme.isDark,
            onChanged: (_) => theme.toggleTheme(),
          ),
          FilledButton.icon(
            onPressed: theme.toggleTheme,
            icon: Icon(theme.isDark ? Icons.light_mode : Icons.dark_mode),
            label: Text(theme.isDark ? 'Switch to light mode' : 'Switch to dark mode'),
          ),
        ],
      )),
    );
  }
}
