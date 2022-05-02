// Import
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bubble/constants/colors.dart';

// Light theme data
ThemeData lightThemeData() {
  return ThemeData.light().copyWith(
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    backgroundColor: colorBackgroundLight,
    scaffoldBackgroundColor: colorBackgroundLight,
    cardColor: colorCardLight,
    iconTheme: const IconThemeData(color: colorIconDark),
    textTheme: GoogleFonts.interTextTheme().apply(bodyColor: colorTextDark),
    primaryTextTheme: const TextTheme(headline6: TextStyle(color: colorTextDark)),
  );
}

// Dark theme data
ThemeData darkThemeData() {
  return ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    backgroundColor: colorBackgroundDark,
    scaffoldBackgroundColor: colorBackgroundDark,
    cardColor: colorCardDark,
    iconTheme: const IconThemeData(color: colorIconLight),
    textTheme: GoogleFonts.interTextTheme().apply(bodyColor: colorTextLight),
    primaryTextTheme: const TextTheme(headline6: TextStyle(color: colorTextLight)),
  );
}
