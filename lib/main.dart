import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/conversion_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/home_screen.dart';

void main() => runApp(const UnitConverterApp());

class UnitConverterApp extends StatelessWidget {
  const UnitConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seed = Color(0xFF087CF0);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ConversionProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, theme, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Unit Converter',
          themeMode: theme.mode,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.light),
            scaffoldBackgroundColor: const Color(0xFFF5F8FC),
            appBarTheme: const AppBarTheme(
              backgroundColor: seed,
              foregroundColor: Colors.white,
              elevation: 0,
              centerTitle: false,
            ),
            cardTheme: CardThemeData(
              color: Colors.white,
              elevation: 1,
              shadowColor: const Color(0x160B2B50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: const Color(0xFFF9FBFE),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Color(0xFFD9E3F0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Color(0xFFD9E3F0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: seed, width: 1.8),
              ),
            ),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.dark),
            appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF10233F), foregroundColor: Colors.white),
            cardTheme: CardThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
