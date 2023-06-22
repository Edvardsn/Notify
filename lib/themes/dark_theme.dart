import 'package:flutter/material.dart';

class DarkTheme {
  static ThemeData get themeData {
    return ThemeData.dark().copyWith(
      useMaterial3: true,
      listTileTheme: ListTileThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          tileColor: Colors.white),
      primaryColor: const Color(0xFF14181b),
      focusColor: const Color(0xFF0A0C0E),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.green.shade800,
      ),
      primaryTextTheme: const TextTheme(
        displayLarge: TextStyle(color: Colors.white),
        labelSmall: TextStyle(
          color: Color(0xFF57636C),
        ),
      ),
    );
  }
}
