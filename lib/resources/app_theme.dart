import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get() {
    return ThemeData.dark().copyWith(
      textTheme: ThemeData.dark()
          .textTheme
          .copyWith(
            button: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          )
          .apply(
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
    );
  }
}
