import 'package:flutter/material.dart';

class AppTheme {
  static Color primary = Colors.green;

  static final ThemeData dartTheme = ThemeData.dark().copyWith(
      appBarTheme: AppBarTheme(backgroundColor: primary),
      primaryColor: primary,
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: primary));
}
