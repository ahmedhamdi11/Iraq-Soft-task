import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/constants/colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      surfaceTint: Colors.white,
      seedColor: kPrimaryColor,
      primary: kPrimaryColor,
      brightness: Brightness.light,
    ),
    textTheme: GoogleFonts.dmSansTextTheme(),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
    ),
  );
}
