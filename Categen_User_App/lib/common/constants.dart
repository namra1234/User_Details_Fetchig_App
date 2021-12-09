import 'package:flutter/material.dart';

import 'colorConstants.dart';


class Constants {
  static const int SPLASH_SCREEN_TIME = 2;
  static String baseurl = 'https://gorest.co.in/public/v1/users';

  static double screenHeight=0,
      screenWidth=0,
      screenSize=0,
      textscaleFactor=0,
      blockSizeHorizontal=0,
      blockSizeVertical=0;
  static bool isLoading = false,internet=true,firstTime=true;

  static bool isVisible = false;

  static Widget buildProgressIndicator() {
    return Center(
      child: Container(
        width: Constants.screenWidth,
        color: ColorConstants.primaryColor,
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: ColorConstants.primaryColor,
            valueColor:
                new AlwaysStoppedAnimation<Color>(ColorConstants.whiteColor),
          ),
        ),
      ),
    );
  }


}

