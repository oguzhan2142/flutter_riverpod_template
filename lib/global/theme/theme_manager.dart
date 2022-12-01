import 'package:flutter/material.dart';

import 'colors.dart';
import 'primary_swatch.dart';

class ThemeManager {
  static final ThemeManager instance = ThemeManager._();
  ThemeManager._();

  final lightTheme = ThemeData(
    primarySwatch: primarySwatch,
    scaffoldBackgroundColor: beige,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        size: 22,
        color: black,
      ),
      elevation: 0,
      toolbarHeight: 40,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        minimumSize: MaterialStateProperty.all(const Size.fromHeight(kTextTabBarHeight)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        minimumSize: MaterialStateProperty.all(const Size.fromHeight(kTextTabBarHeight)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: white,
    ),
  );
}
