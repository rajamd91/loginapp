//
//
//
import 'package:flutter/material.dart';
// import 'package:loginapp/src/constants/colors.dart';
//
// import '../../../constants/sizes.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class TOutlineButtonTheme {
  TOutlineButtonTheme._();

  static final lightOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      foregroundColor: tSecondaryColor,
      side: const BorderSide(color: tSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );
  static final DarkOutlineButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    shape: const RoundedRectangleBorder(),
    foregroundColor: tWhiteColor,
    side: const BorderSide(color: tWhiteColor),
    padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
  ));
}
