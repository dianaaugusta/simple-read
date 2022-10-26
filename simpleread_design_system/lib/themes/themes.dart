import 'package:flutter/material.dart';
import 'package:simpleread_design_system/tokens/colors.dart';
import 'package:simpleread_design_system/tokens/typography.dart';

final SimplereadTheme = ThemeData(

    primaryColor: SimplereadColors.defaultFontColor,
    primarySwatch: SimplereadColors.brandPrimaryMat,
    backgroundColor: SimplereadColors.bgColor,
    scaffoldBackgroundColor: SimplereadColors.bgColor,
    textTheme: const TextTheme(
        headline1: TextStyle(
          fontFamily: SimplereadTypography.defaultFont,
          fontWeight: FontWeight.w700,
          fontSize: SimplereadTypography.sizeLG,
          color: SimplereadColors.defaultFontColor,
        ),
        headline2: TextStyle(
          fontFamily: SimplereadTypography.defaultFont,
          fontWeight: FontWeight.w400,
          fontSize: SimplereadTypography.sizeSM,
          color: SimplereadColors.subtitleColor,
        ),
        headline3: TextStyle(
          fontFamily: SimplereadTypography.defaultFont,
          fontWeight: FontWeight.w500,
          fontSize: SimplereadTypography.sizeMD,
          color: SimplereadColors.defaultFontColor,
        )));
