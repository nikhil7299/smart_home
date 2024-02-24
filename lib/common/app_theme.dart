import 'package:smart_home/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();
  static ThemeData light = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.seedColor,
    ),
    textTheme: GoogleFonts.urbanistTextTheme(
      ThemeData.light().textTheme,
    ),
    primaryTextTheme: GoogleFonts.urbanistTextTheme(
      ThemeData.light().primaryTextTheme,
    ),
  );
  static ThemeData dark = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.seedColor,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 8, 9, 12),
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: Colors.transparent,
      // iconTheme: const IconThemeData(opacity: 1),
      // titleTextStyle: const TextStyle(color: Colors.white, fontSize: 25)
    ),
    textTheme: GoogleFonts.urbanistTextTheme(
      ThemeData.dark().textTheme,
    ),
    primaryTextTheme: GoogleFonts.urbanistTextTheme(
      ThemeData.dark().primaryTextTheme,
    ),
  );
}
