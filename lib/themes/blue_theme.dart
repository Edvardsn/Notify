import 'package:flutter/material.dart';

class BlueTheme {
  Color color = const Color(0xff94a2f2);

  static List<Color> colors = [
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

  Map<String, Color> palette = Map.fromIterables(type, colors);

  static ColorScheme fullPalette =
      ColorScheme.fromSeed(seedColor: const Color(0xff26292b));

  static TextTheme textTheme = const TextTheme();
  static AppBarTheme appBarTheme = AppBarTheme(color: Colors.amber);
  // static BottomNavigationBarTheme bottomNavigationBarTheme = BottomNavigationBarTheme(data: data, child: child)

  static ThemeData get themeData {
    // return ThemeData.from(colorScheme: fullPalette, useMaterial3: true);
    return ThemeData.from(
            colorScheme: const ColorScheme.dark(),
            textTheme: Typography.whiteRedmond,
            useMaterial3: true)
        .copyWith(appBarTheme: appBarTheme);
  }
}
