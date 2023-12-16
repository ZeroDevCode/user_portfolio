// ignore: unused_import
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/home_screen.dart';
import 'package:my_portfolio/splash_screen.dart';
import 'package:my_portfolio/theme/mode_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ModelTheme(),
      child: Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                useMaterial3: true,
                fontFamily: GoogleFonts.poppins().fontFamily,
                brightness:
                    themeNotifier.isDark ? Brightness.dark : Brightness.light),
            themeMode: themeNotifier.isDark ? ThemeMode.dark : ThemeMode.light,
            routes: {
              '/': (context) => const SplashScreen(),
              '/home': (context) => const MyHomePage()
            },
          );
        },
      ),
    );
  }
}
