import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import '../../../constants/colors.dart';
import '../../constants/colors.dart';

class TTextTheme {
  TTextTheme._();
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(
        fontSize: 28, color: tDarkColor, fontWeight: FontWeight.bold),
    displayMedium: GoogleFonts.montserrat(
        fontSize: 24, color: tDarkColor, fontWeight: FontWeight.w700),
    displaySmall: GoogleFonts.poppins(
        color: tDarkColor, fontSize: 24, fontWeight: FontWeight.w700),
    headlineMedium: GoogleFonts.poppins(
        color: tDarkColor, fontSize: 16, fontWeight: FontWeight.w600),
    titleLarge: GoogleFonts.poppins(
        color: tDarkColor, fontSize: 14, fontWeight: FontWeight.w600),
    bodyLarge: GoogleFonts.poppins(
        color: tDarkColor, fontSize: 14, fontWeight: FontWeight.normal),
    bodyMedium: GoogleFonts.poppins(
        color: tDarkColor, fontSize: 14, fontWeight: FontWeight.normal),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(
        fontSize: 28, color: tWhiteColor, fontWeight: FontWeight.bold),
    displayMedium: GoogleFonts.montserrat(
        fontSize: 24, color: tWhiteColor, fontWeight: FontWeight.w700),
    displaySmall: GoogleFonts.poppins(
        color: tWhiteColor, fontSize: 24, fontWeight: FontWeight.w700),
    headlineMedium: GoogleFonts.poppins(
        color: tWhiteColor, fontSize: 16, fontWeight: FontWeight.w600),
    titleLarge: GoogleFonts.poppins(
        color: tWhiteColor, fontSize: 14, fontWeight: FontWeight.w600),
    bodyLarge: GoogleFonts.poppins(
        color: tWhiteColor, fontSize: 14, fontWeight: FontWeight.normal),
    bodyMedium: GoogleFonts.poppins(
        color: tWhiteColor, fontSize: 14, fontWeight: FontWeight.normal),
  );
}
