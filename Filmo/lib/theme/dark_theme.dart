import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  brightness:  Brightness.dark,
  textTheme: GoogleFonts.outfitTextTheme(),
  colorScheme: const ColorScheme.dark(
    background: Color.fromARGB(255, 0, 0, 0),
    primary: Colors.amber,
    primaryContainer: Color.fromARGB(255, 27, 25, 25),
    secondary: Color.fromARGB(255, 253, 253, 253),
    tertiary: Color.fromARGB(255, 64, 64, 64)
  ),
);
