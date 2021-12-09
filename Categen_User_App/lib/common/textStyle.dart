import 'dart:ui';

import 'package:flutter/material.dart';

import 'colorConstants.dart';

class CustomTextStyle {
  static TextStyle splashWelcome({required double size,required double height,required double width}) {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: (size == null && size == '') ? 36 : (width * size) / 375,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      // lineHeight: 47px,
      letterSpacing: -0.01,
    );
  }

  static TextStyle customText({required double size,required double height,required double width}) {
    return TextStyle(
      fontFamily: 'Poppins',
      color: ColorConstants.primaryColor,
      fontSize: (size == null && size == '') ? 24 : (width * size) / 375,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      // lineHeight: 47px,
      letterSpacing: -0.01,
    );
  }

  static TextStyle normalText({required double size}) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: size,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      // lineHeight: 47px,
      color: ColorConstants.blackColor,
      letterSpacing: -0.01,
    );
  }
}
