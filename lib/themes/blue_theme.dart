import 'package:flutter/material.dart';

class BlueTheme {
  Color color = const Color(0xff94a2f2);

  static List<Color> colorsExample = [
    const Color(0xff26292b),
    const Color(0xff2e3239),
    const Color(0xff5f7adb),
    const Color(0xffa2b2ee)
  ];

  static List<String> type = [
    "Background/canvas",
    "onButton/additionalButtonColor",
    "Primary",
    "Secondary"
  ];

  Map<String, Color> palette = Map.fromIterables(type, colorsExample);

  static ColorScheme colors = const ColorScheme(
    background: Color(0xFF14181b),
    onBackground: Colors.blue,
    primary: Color(0xff5f7adb),
    onPrimary: Colors.white70,
    secondary: Color(0xffa2b2ee),
    onSecondary: Colors.white70,
    tertiary: Color(0xFF0A0C0E),
    onTertiary: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
    brightness: Brightness.light,
    error: Colors.red,
    onError: Colors.white,
  );

  static AppBarTheme appBarTheme = AppBarTheme(
      backgroundColor: colors.tertiary,
      titleTextStyle: TextStyle(color: colors.onTertiary, fontSize: 24));

  static ThemeData get themeData {
    return ThemeData.from(
            colorScheme: colors,
            // textTheme: Typography.whiteRedmond,
            useMaterial3: true)
        .copyWith(appBarTheme: appBarTheme);
  }
}
