import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/stage_card.dart';
import '../widgets/responsive_content.dart';
import 'converter_screen.dart';
import 'history_screen.dart';
import 'about_screen.dart';
import 'dart_basics_screen.dart';
import 'widgets_layouts_screen.dart';
import 'responsive_ui_screen.dart';
import 'navigation_screen.dart';
import 'state_management_screen.dart';
import 'custom_widgets_themes_screen.dart';
import 'forms_validation_screen.dart';
import 'animations_screen.dart';
import 'rest_api_screen.dart';
import 'testing_debugging_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tab = 0;

  final stageScreens = const [
    DartBasicsScreen(), WidgetsLayoutsScreen(), ResponsiveUiScreen(),
    NavigationScreen(), StateManagementScreen(), CustomWidgetsThemesScreen(),
    FormsValidationScreen(), AnimationsScreen(), RestApiScreen(), TestingDebuggingScreen(),
  ];

  final stageData = const [
    ('Dart Basics', 'Variables, types, conditions and functions.', Icons.code_rounded, Color(0xFF142D3D)),
    ('Widgets & Layouts', 'Build interfaces with reusable widgets.', Icons.widgets_rounded, Color(0xFF1688F5)),
    ('Responsive UI', 'Layouts that adapt to screen sizes.', Icons.devices_rounded, Color(0xFF6C63FF)),
    ('Navigation', 'Move between app pages.', Icons.navigation_rounded, Color(0xFF0B83E6)),
    ('State Management', 'Manage values with Provider.', Icons.sync_rounded, Color(0xFF12A879)),
    ('Custom Widgets & Themes', 'Reusable components and themes.', Icons.palette_rounded, Color(0xFF8B5CF6)),
    ('Forms & Validation', 'Validate user input.', Icons.fact_check_rounded, Color(0xFFF59E0B)),
    ('Animations', 'Add motion and transitions.', Icons.animation_rounded, Color(0xFF7C3AED)),
    ('REST API', 'Fetch and display remote data.', Icons.cloud_download_rounded, Color(0xFF0284C7)),
    ('Testing & Debugging', 'Verify app behavior.', Icons.bug_report_rounded, Color(0xFF0F766E)),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    final pages = [_buildStages(), const ConverterScreen(), const HistoryScreen(), const AboutScreen()];
    return Scaffold(
      appBar: AppBar(
        title: const Row(children: [
          Icon(Icons.swap_horizontal_circle_rounded, size: 29),
          SizedBox(width: 10),
          Text('Unit Converter', style: TextStyle(fontWeight: FontWeight.w800)),
        ]),
        actions: [
          IconButton(
            tooltip: theme.isDark ? 'Switch to light mode' : 'Switch to dark mode',
            onPressed: theme.toggleTheme,
            icon: Icon(theme.isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
          ),
          const SizedBox(width: 4),
        ],
      ),
      drawer: NavigationDrawer(
        selectedIndex: tab,
        onDestinationSelected: (index) {
          setState(() => tab = index);
          Navigator.pop(context);
        },
        children: const [
          Padding(
            padding: EdgeInsets.fromLTRB(26, 22, 16, 14),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CircleAvatar(radius: 28, backgroundColor: Color(0xFFE1F0FF),
                child: Icon(Icons.swap_horiz_rounded, color: Color(0xFF087CF0), size: 30)),
              SizedBox(height: 12),
              Text('UNIT CONVERTER', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1)),
              SizedBox(height: 3),
              Text('Flutter Lab Project', style: TextStyle(color: Colors.grey)),
            ]),
          ),
          NavigationDrawerDestination(icon: Icon(Icons.grid_view_rounded), label: Text('Experiments')),
          NavigationDrawerDestination(icon: Icon(Icons.swap_horiz_rounded), label: Text('Converter')),
          NavigationDrawerDestination(icon: Icon(Icons.history_rounded), label: Text('History')),
          NavigationDrawerDestination(icon: Icon(Icons.info_outline_rounded), label: Text('About')),
        ],
      ),
      body: SafeArea(child: pages[tab]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (index) => setState(() => tab = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.grid_view_rounded), label: 'Stages'),
          NavigationDestination(icon: Icon(Icons.swap_horiz_rounded), label: 'Convert'),
          NavigationDestination(icon: Icon(Icons.history_rounded), label: 'History'),
          NavigationDestination(icon: Icon(Icons.info_outline_rounded), label: 'About'),
        ],
      ),
    );
  }

  Widget _buildStages() => ResponsiveContent(
    child: LayoutBuilder(builder: (context, constraints) {
      final columns = constraints.maxWidth > 1000 ? 3 : constraints.maxWidth > 620 ? 2 : 1;
      return ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF16B8F3), Color(0xFF087CF0), Color(0xFF6559F5)],
                begin: Alignment.topLeft, end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: const [BoxShadow(color: Color(0x25087CF0), blurRadius: 18, offset: Offset(0, 8))],
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
                decoration: BoxDecoration(color: Colors.white.withOpacity(.2), borderRadius: BorderRadius.circular(30)),
                child: const Text('FLUTTER LAB • 10 EXPERIMENTS',
                  style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w800, letterSpacing: .7)),
              ),
              const SizedBox(height: 18),
              const Text('Convert units.\nLearn Flutter.', style: TextStyle(
                color: Colors.white, fontSize: 30, height: 1.12, fontWeight: FontWeight.w900)),
              const SizedBox(height: 10),
              Text('Explore the experiments or try the converter now.',
                style: TextStyle(color: Colors.white.withOpacity(.92), fontSize: 14)),
              const SizedBox(height: 18),
              FilledButton.icon(
                style: FilledButton.styleFrom(backgroundColor: Colors.white, foregroundColor: const Color(0xFF087CF0)),
                onPressed: () => setState(() => tab = 1),
                icon: const Icon(Icons.swap_horiz_rounded),
                label: const Text('Open Converter'),
              ),
            ]),
          ),
          const SizedBox(height: 24),
          Row(children: [
            const Expanded(child: Text('Experiments', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900))),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: BoxDecoration(color: const Color(0xFFE3F0FF), borderRadius: BorderRadius.circular(30)),
              child: const Text('01 — 10', style: TextStyle(color: Color(0xFF087CF0), fontWeight: FontWeight.w800)),
            ),
          ]),
          const SizedBox(height: 5),
          const Text('Select an experiment to view its demonstration.', style: TextStyle(color: Color(0xFF718096))),
          const SizedBox(height: 14),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: stageData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 13,
              mainAxisSpacing: 13,
              mainAxisExtent: 150,
            ),
            itemBuilder: (context, index) {
              final data = stageData[index];
              return StageCard(
                number: index + 1, title: data.$1, description: data.$2, icon: data.$3,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => stageScreens[index])),
              );
            },
          ),
        ],
      );
    }),
  );
}
