import 'package:flutter/material.dart';
import '../utils/material_color_generator.dart';

class Themes with MaterialColorGenerator {
  /// Dark theme for UnderControl app.
  ThemeData darkTheme() => ThemeData(
        useMaterial3: true,
        primaryColor: const Color.fromRGBO(0, 240, 130, 100),
        // primaryColor: const Color.fromARGB(255, 28, 154, 97),
        primarySwatch: createMaterialColor(
          const Color.fromRGBO(0, 240, 130, 100),
        ),
        brightness: Brightness.dark,
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color(0xFF191919),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 30, 30, 30),
        cardColor: const Color.fromARGB(255, 50, 50, 50),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 40, 40, 40),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromRGBO(0, 240, 130, 100),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            minimumSize: const Size(double.infinity, 48),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.grey.shade800,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 28, 154, 97),
        ),
        highlightColor: Colors.amber,
      );
}
