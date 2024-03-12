//
//
//
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/src/constants/colors.dart';

import '../../../constants/sizes.dart';

class TOutlineButtonTheme {
  TOutlineButtonTheme._();

  static final lightOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor: tSecondaryColor,
      side: BorderSide(color: tSecondaryColor),
      padding: EdgeInsets.symmetric(vertical: tButtonHieght),
    ),
  );
  static final DarkOutlineButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(),
    foregroundColor: tWhiteColor,
    side: BorderSide(color: tWhiteColor),
    padding: EdgeInsets.symmetric(vertical: tButtonHieght),
  ));
}
