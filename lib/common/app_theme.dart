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
      // background: Colors.black,
    ),

    // colorScheme: ColorScheme.dark(),
    scaffoldBackgroundColor: const Color.fromARGB(255, 8, 9, 12),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(opacity: 1),
    ),
    // iconTheme: const IconThemeData(opacity: 1),
    // dividerTheme: const DividerThemeData(thickness: .3),

    primaryIconTheme: const IconThemeData(opacity: 1),
    textTheme: GoogleFonts.urbanistTextTheme(
      ThemeData.dark().textTheme,
    ),
    primaryTextTheme: GoogleFonts.urbanistTextTheme(
      ThemeData.dark().primaryTextTheme,
    ),
  );
}
