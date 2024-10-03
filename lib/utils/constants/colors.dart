import 'package:flutter/material.dart';

class TColors {
  TColors._();

  /// App Basic Colors
  static const Color primary = Color(0xFF001BFF);
  static const Color secondary = Color(0xFFFFE400);
  static const Color accent = Color(0xFFb0c7ff);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color white = Color(0xFFFFFFFF);

  //static const Color light = Colors.white;
  static const Color black = Color(0xFF232323);

  //static const Color dark = Colors.black;
  static const Color darkGrey = Color(0xFF939393);
  static const Color darkerGrey = Color(0xFF4F4F4F);

  /// Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C7570);
  static const Color textWhite = Colors.white;

  /// Border Colors
  static const Color borderPrimary = Color(0xFFA9A9A9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  /// BackGround Colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  /// Background Container Colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = TColors.white.withOpacity(0.1);

  /// Natural Shades
  //static const Color black = Color(0xFF232323);
  //static const Color darkerGrey = Color(0xFF4F4F4F);
  //static const Color darkGrey = Color(0xFF939393);
  //static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  //static const Color white = Color(0xFFFFFFFF);

  /// Error and validation colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF001BFF);
}

const tPrimaryColor = Color(0xFFFFE400);
const tSecondaryColor = Color(0xFF272727);
const tAccentColor = Color(0xFF001BFF);

const tCardBgColor = Color(0xFFF7F6F1);
const tWhiteColor = Color(0xffffffff);
const tDarkColor = Color(0xFF000000);

const tOnBoardingPage1Color = Color(0xFFFFFFFF);
const tOnBoardingPage2Color = Color(0xfffddcdf);
const tOnBoardingPage3Color = Color(0xffffdcbd);
